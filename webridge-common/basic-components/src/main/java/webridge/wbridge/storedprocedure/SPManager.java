package webridge.wbridge.storedprocedure;

import webridge.wbridge.sql.SymbolicSQLTemplate;
import webridge.wbridge.sql.types.SQLVarType;
import webridge.wbridge.sql.types.SqlType;
import webridge.wbridge.symbc.numeric.Expression;
import webridge.wbridge.symbc.numeric.SymbolicInteger;
import webridge.wbridge.symbc.string.StringSymbolic;
import java.io.*;
import java.util.*;
import java.util.function.Consumer;
import java.util.stream.Collectors;
import org.apache.commons.lang3.NotImplementedException;
import org.apache.commons.lang3.SerializationException;
import org.apache.commons.lang3.SerializationUtils;
import org.apache.commons.lang3.StringUtils;

public class SPManager {
  private static final List<SQLList> SQL_LIST_SEQUENCE = new ArrayList<>();
  private static SQLList curSQLList = new SQLList();
  private static int returnLine = 0;

  public static boolean POST_PROCESSED = false; // have been post processed or not
  public static final String DEFER_PARAM_IDENTIFIER_PREFIX = "DEFER_";
  public static final String DEFER_PARAM_KEY =
      DEFER_PARAM_IDENTIFIER_PREFIX + "%s_%d_%d"; // spName_queryId_colId

  // TODO remove this variable
  private static boolean requireNewSpLater = false;

  public static void setRequireNewSpLater(boolean requireNewSpLater) {
    SPManager.requireNewSpLater = requireNewSpLater;
  }

  public static List<SQLList> getSqlListSequence() {
    return SQL_LIST_SEQUENCE;
  }

  public static int getReturnLine() {
    return returnLine;
  }

  public static void setReturnLine(int returnLine) {
    SPManager.returnLine = returnLine;
  }

  public static SQLList getCurrentSQLList() {
    return curSQLList;
  }

  private static void setCurrentSPList(SQLList sqlList) {
    curSQLList = sqlList;
  }

  private static void processDeferExecMerge() {
    final List<SQLList> sqlListSequence = SPManager.getSqlListSequence();

    for (int i = 1; i <= sqlListSequence.size() - 1; i++) {
      final SQLList prevSp = sqlListSequence.get(i - 1);
      final SQLList nextSp = sqlListSequence.get(i);
      // 1. rename nd param of prevSp's first SQL
      //  if (!prevSp.isEmptySp(true)) {
      //    final SymbolicSQLTemplate firstSql = prevSp.firstSQLStmt(false);
      //    handleNdParamRename(prevSp, firstSql, 0 /* first sql has query id of 0 */);
      //  }

      // 2. check merge condition
      if (nextSp.isEmptySp(true) || prevSp.getConnectionNo() != nextSp.getConnectionNo()) continue;
      final SymbolicSQLTemplate template = nextSp.firstSQLStmt(false);
      if (!template.nonDeterministicType().equals(BreakInfo.ND_FUNC_IN_PARAM)) continue;
      if (template.getSqlType().equals(SqlType.SELECT)) continue;
      int queryId = prevSp.getSymbolicSQLTemplates().size();
      // 3. merge the two sql templates
      prevSp.appendSQLTemplates(nextSp.getSymbolicSQLTemplates());
      // 4. place non-deterministic sqls in a new-sp
      final List<SymbolicSQLTemplate> ndSqlTemps = new ArrayList<>();
      for (SymbolicSQLTemplate symbolicSQLTemplate :
          nextSp.getSymbolicSQLTemplates().stream()
              .filter(SymbolicSQLTemplate::isNonDeterministic)
              .collect(Collectors.toList())) {
        final SymbolicSQLTemplate clone = SerializationUtils.clone(symbolicSQLTemplate);
        // set to false will enable generating real SQLs
        clone.setNonDeterministic(BreakInfo.NOT_BREAK);
        ndSqlTemps.add(clone);
      }

      prevSp.getNdSqlCtx().appendSQLTemplates(ndSqlTemps);

      // // 5. set sql parameters to use defer stored ones
      // for (SymbolicSQLTemplate symbolicSQLTemplate :
      //     prevSp.getNdSqlCtx().getSymbolicSQLTemplates()) {
      //   handleNdParamRename(prevSp, symbolicSQLTemplate, queryId);
      // }

      // 6. remove the merged SQL, processing next one
      sqlListSequence.remove(i);
      i--;
    }
  }

  private static String resetNDParam(
      final SQLList ctx,
      final SymbolicSQLTemplate template,
      final int paramIdx,
      final int sqlNo,
      final SQLVarType type) {
    final String varName = generateNdParamName(ctx, paramIdx, sqlNo);
    Expression exp;
    switch (type) {
      case DATE:
      case DATETIME:
      case BIGINT:
        exp = new SymbolicInteger(varName);
        break;
      case VARCHAR:
        exp = new StringSymbolic(varName);
        break;
      default:
        throw new NotImplementedException(type.toString());
    }
    resetParamGlobally(
        template.getParameterExprs().get(paramIdx),
        varName,
        template.getParameterSymbolics().get(paramIdx),
        exp);
    return varName;
  }

  private static void resetParamGlobally(
      String oldName, String newName, Object oldSymbolic, Object newSymbolic) {
    Consumer<? super SymbolicSQLTemplate> action =
        template -> {
          for (int pIdx = 0; pIdx < template.getParameterExprs().size(); pIdx++) {
            if (Objects.equals(template.getParameterExprs().get(pIdx), oldName)) {
              template.setParamExprAt(pIdx, newName);
            }
            if (Objects.equals(template.getParameterSymbolics().get(pIdx), oldSymbolic)) {
              template.setParamSymbolicAt(pIdx, newSymbolic);
            }
          }
        };
    SQL_LIST_SEQUENCE.forEach(
        sp -> {
          sp.getSymbolicSQLTemplates().forEach(action);
          if (!sp.getNdSqlCtx().isEmptySp(false)) {
            sp.getNdSqlCtx().getSymbolicSQLTemplates().forEach(action);
          }
        });
  }

  public static String generateNdParamName(SQLList ctx, int paramIdx, int sqlNo) {
    return String.format(
        DEFER_PARAM_KEY, ctx.getEntryPoint().getSpName().replace("_nd", ""), sqlNo, paramIdx);
  }

  public static int resolveNdParamInvocationNumber(String ndParam) {
    // TODO currently only handle current time ms, uuid to string in pc
    if (StringUtils.isNoneEmpty()
        && (ndParam.contains("currentTimeMs") || ndParam.contains("uuidToString"))) {
      final String[] parts = ndParam.split("__");
      assert parts.length == 5 : "unexpected format of nd_var";
      return Integer.parseInt(parts[parts.length - 1]);
    }
    throw new IllegalArgumentException("Invalid param format:" + ndParam);
  }

  private static class SPRestorer {
    SQLList storedSP;

    SPRestorer() {
      SQLList curSp = SPManager.getCurrentSQLList();
      //      storedSP = SerializationUtils.deserialize(SerializationUtils.serialize(curSp));

      final ByteArrayOutputStream baos = new ByteArrayOutputStream(512);
      try (ObjectOutputStream out = new ObjectOutputStream(baos)) {
        out.writeObject(curSp);
      } catch (final IOException ex) {
        throw new SerializationException(ex);
      }
      ByteArrayInputStream bios = new ByteArrayInputStream(baos.toByteArray());

      try (ObjectInputStream in = new ObjectInputStream(bios)) {
        storedSP = (SQLList) in.readObject();
      } catch (final ClassNotFoundException | IOException ex) {
        throw new SerializationException(ex);
      }
    }
  }
}
