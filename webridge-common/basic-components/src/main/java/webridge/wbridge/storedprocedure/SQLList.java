package webridge.wbridge.storedprocedure;

import webridge.wbridge.sql.SymSQL;
import webridge.wbridge.sql.SymbolicSQLTemplate;
import webridge.wbridge.sql.types.SQLVarType;
import webridge.wbridge.storedprocedure.utils.SQLPCUtil;
import webridge.wbridge.symbc.numeric.Expression;
import webridge.wbridge.symbc.numeric.PathCondition;
import webridge.wbridge.symbc.numeric.SymbolicInteger;
import webridge.wbridge.symbc.string.StringSymbolic;
import java.io.Serializable;
import java.util.*;
import org.apache.commons.lang3.NotImplementedException;
import org.apache.commons.lang3.SerializationUtils;

public class SQLList implements Serializable, SPContext {
  private EntryPoint entryPoint;
  private final List<SymbolicSQLTemplate> symbolicSQLTemplates = new ArrayList<>();
  private Map<String, SQLVarType> dependentVariables;
  private SQLList ndSqlCtx;
  // query id, defer map
  private final Map<Integer, Map<Integer, String>> ndColumnMap = new HashMap<>();
  private boolean isNdSqlInside;
  private boolean isWriteNdSqlInside;

  public Map<Integer, Map<Integer, String>> getNdColumnMap() {
    return ndColumnMap;
  }

  public SQLList getNdSqlCtx() {
    if (ndSqlCtx == null) {
      ndSqlCtx = new SQLList();
      final EntryPoint epClone = SerializationUtils.clone(entryPoint);
      epClone.resetDefferSpName(entryPoint.getSpIdCounter());
      epClone.clearStackTrace(); // FIXME: What is the stack trace for nd sql?
      ndSqlCtx.setEntryPoint(epClone);
    }
    return ndSqlCtx;
  }

  public void setNdSqlCtx(SQLList ndSqlCtx) {
    this.ndSqlCtx = ndSqlCtx;
  }

  public void appendSQLTemplates(final List<SymbolicSQLTemplate> symbolicSQLTemplates) {
    this.symbolicSQLTemplates.addAll(symbolicSQLTemplates);
  }

  public void addSQLTemplate(SymbolicSQLTemplate sqlTemplate) {
    assert symbolicSQLTemplates.isEmpty()
        || symbolicSQLTemplates.get(0).getConnNo() == sqlTemplate.getConnNo()
        || txnCtlOnly(); // deem as empty sp if all sqls are txn-control stmts
    symbolicSQLTemplates.add(sqlTemplate);
  }

  public boolean txnCtlOnly() {
    return symbolicSQLTemplates.stream().allMatch(t -> t.getSqlNo() == -1);
  }

  public SymbolicSQLTemplate firstSQLStmt(boolean considerTxnCtl) {
    if (symbolicSQLTemplates.isEmpty()) throw new RuntimeException("Empty sp!");
    if (considerTxnCtl) return symbolicSQLTemplates.get(0);
    else {
      for (SymbolicSQLTemplate template : symbolicSQLTemplates) {
        if (template.getSqlNo() != -1) return template;
      }
    }
    throw new RuntimeException("Empty sp!");
  }

  // TODO replace all call to this function with getSymSQLList
  public List<SymbolicSQLTemplate> getSymbolicSQLTemplates() {
    return Collections.unmodifiableList(symbolicSQLTemplates);
  }

  @Override
  public Iterator<SymSQL> getSymSQLList() {
    Iterator<SymbolicSQLTemplate> templateIterator = symbolicSQLTemplates.listIterator();
    return new Iterator<SymSQL>() {
      @Override
      public boolean hasNext() {
        return templateIterator.hasNext();
      }

      @Override
      public SymSQL next() {
        return templateIterator.next();
      }
    };
  }

  public boolean isEmptySp(boolean ignoreTxnControlStmt) {
    if (!ignoreTxnControlStmt) return getSymbolicSQLTemplates().isEmpty();
    else {
      for (SymbolicSQLTemplate template : getSymbolicSQLTemplates()) {
        final int sqlNo = template.getSqlNo();
        if (sqlNo != -1) return false;
      }
      return true;
    }
  }

  public int getConnectionNo() {
    return symbolicSQLTemplates.isEmpty() ? -1 : symbolicSQLTemplates.get(0).getConnNo();
  }

  public EntryPoint getEntryPoint() {
    return entryPoint;
  }

  public void setEntryPoint(EntryPoint entryPoint) {
    this.entryPoint = entryPoint;
  }

  @Override
  public Map<String, SQLVarType> extractDependentVariables() {
    if (dependentVariables != null) return dependentVariables;
    dependentVariables = new HashMap<>();
    final Set<String> existing = new HashSet<>();

    // collect dependent variables from pc
    symbolicSQLTemplates.forEach(
        symbolicSQLTemplate -> {
          final PathCondition originalPc = symbolicSQLTemplate.getOriginalPc();
          if (originalPc != null && originalPc.header != null) {
            SQLPCUtil.collectConstraintVariables(originalPc.header, dependentVariables);
            SQLPCUtil.collectConstraintVariables(originalPc.spc.header, dependentVariables);
          }
        });
    // collect dependent variables from param, for a write sql with nd func in param,
    // we will defer them, so their params are not dependent
    symbolicSQLTemplates.stream()
        .filter(
            symbolicSQLTemplate -> {
              if (SPConfig.ENABLE_DEFER_EXECUTION) {
                return symbolicSQLTemplate.nonDeterministicType() != BreakInfo.ND_FUNC_IN_PARAM
                    || !symbolicSQLTemplate.getSqlType().isWriteSql();
              } else {
                return true;
              }
            })
        .forEach(
            symbolicSQLTemplate -> {
              for (int i = 0; i < symbolicSQLTemplate.getParameterSymbolics().size(); i++) {
                Expression parameterSymbolic = symbolicSQLTemplate.getParameterSymbolics().get(i);
                if (parameterSymbolic == null) continue;
                SQLPCUtil.collectExpressionVariable(parameterSymbolic, dependentVariables);
                if (SQLPCUtil.containsTransformedNonDeterministicRetVal(
                    parameterSymbolic.toString())) {
                  final String varName = parameterSymbolic.toString();
                  switch (symbolicSQLTemplate.getParameterTypes().get(i)) {
                    case VARCHAR:
                      dependentVariables.put(varName, SQLVarType.VARCHAR);
                      symbolicSQLTemplate
                          .getParameterSymbolics()
                          .set(i, new StringSymbolic(varName));
                      break;
                    case DATE:
                      dependentVariables.put(varName, SQLVarType.DATE);
                      symbolicSQLTemplate
                          .getParameterSymbolics()
                          .set(i, new SymbolicInteger(varName));
                      break;
                    case DATETIME:
                      dependentVariables.put(varName, SQLVarType.DATETIME);
                      symbolicSQLTemplate
                          .getParameterSymbolics()
                          .set(i, new SymbolicInteger(varName));
                      break;
                    case BIGINT:
                      dependentVariables.put(varName, SQLVarType.BIGINT);
                      symbolicSQLTemplate
                          .getParameterSymbolics()
                          .set(i, new SymbolicInteger(varName));
                      break;
                    default:
                      throw new NotImplementedException(
                          symbolicSQLTemplate.getParameterTypes().get(i).toString());
                  }
                  // parameters are fetched from SQL param.
                }
              }
            });

    symbolicSQLTemplates.forEach(
        symbolicSQLTemplate -> {
          final List<List<String>> retSymbolicNames = symbolicSQLTemplate.getRetSymbolicNames();
          retSymbolicNames.forEach(existing::addAll);
          existing.add(symbolicSQLTemplate.getRowCountVarName());
        });
    existing.forEach(dependentVariables::remove);
    return dependentVariables;
  }

  public boolean isNdSqlInside() {
    return isNdSqlInside;
  }

  public void setNdSqlInside(boolean ndSqlInside) {
    isNdSqlInside = ndSqlInside;
  }

  public boolean isWriteNdSqlInside() {
    return isWriteNdSqlInside;
  }

  public void setWriteNdSqlInside(boolean writeNdSqlInside) {
    isWriteNdSqlInside = writeNdSqlInside;
  }

  @Override
  public String toString() {
    return "SQLList{"
        + "entryPoint="
        + entryPoint
        + ", symbolicSQLTemplates="
        + symbolicSQLTemplates
        + '}';
  }
}
