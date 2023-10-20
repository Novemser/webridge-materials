package webridge.graph.processor;

import webridge.graph.SQLNode;
import webridge.sql.result.QueryCounterManager;
import webridge.sql.types.SqlType;

import java.util.*;

/**
 * generator savepoint based on the newTrace, it must be processed before graph split since graph
 * split will remove the 'commit' node.
 */
public class SQLGraphSavepointGenBeforeSplit implements SQLGraphProcessor {

  private static int SAVEPOINT_COUNTER = 0;

  @Override
  public void process(SQLGraphWrapper graphWrapper) {
    Iterator<SQLNode> nodeIterator = graphWrapper.newTrace.getTopologicalSortedNodes();
    Map<Integer, TxnState> txnStatePerConn = new HashMap<>();

    while (nodeIterator.hasNext()) {
      final SQLNode node = nodeIterator.next();
      txnStatePerConn.putIfAbsent(node.getConnNo(), new TxnState());
      TxnState txnState = txnStatePerConn.get(node.getConnNo());

      if (node.getSqlType() == SqlType.COMMIT || node.getSqlType() == SqlType.ENABLE_AUTO_COMMIT) {
        if (txnState.hasWrite) { // if the SQL is within a read-write txn, add savepoint
          String curSavepointName = null;
          for (int i = txnState.nodesInTxn.size() - 1; i >= 0; i--) {
            SQLNode curNode = txnState.nodesInTxn.get(i);
            if (curNode.getSqlType().isWriteSql()) { // only add new savepoint upon a write sql
              int traceId = QueryCounterManager.getTraceId();
              curSavepointName = String.format("trace%d_p%d", traceId, ++SAVEPOINT_COUNTER);
            }
            if (curSavepointName != null) {
              curNode.setSavePointName(curSavepointName);
            }
          }
        }
        txnState.nodesInTxn.clear();
        txnState.inTxn = false;
        txnState.hasWrite = false;
      } else if (node.getSqlType() == SqlType.DISABLE_AUTO_COMMIT) {
        txnState.inTxn = true;
      }

      if (txnState.inTxn) txnState.nodesInTxn.add(node);

      if (node.getSqlType().isWriteSql()) {
//        assert txnState.inTxn : "we cannot handle an auto-commit write SQL.";
        txnState.hasWrite = true;
      }
    }
  }

  private static class TxnState {
    boolean inTxn = false;
    boolean hasWrite = false;
    List<SQLNode> nodesInTxn = new LinkedList<>();
  }
}
