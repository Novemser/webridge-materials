package webridge.storedprocedure;

import webridge.sql.SymSQL;
import webridge.sql.types.SQLVarType;

import java.io.Serializable;
import java.util.Iterator;
import java.util.Map;

public interface SPContext extends Serializable {

  Iterator<SymSQL> getSymSQLList();

  Map<String, SQLVarType> extractDependentVariables();
}
