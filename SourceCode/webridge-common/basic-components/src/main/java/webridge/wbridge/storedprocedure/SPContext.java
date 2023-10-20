package webridge.wbridge.storedprocedure;

import webridge.wbridge.sql.SymSQL;
import webridge.wbridge.sql.types.SQLVarType;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Map;

public interface SPContext extends Serializable {

  Iterator<SymSQL> getSymSQLList();

  Map<String, SQLVarType> extractDependentVariables();
}
