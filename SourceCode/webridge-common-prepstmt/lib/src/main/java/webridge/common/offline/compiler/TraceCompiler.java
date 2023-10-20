package webridge.common.offline.compiler;

import java.rmi.Remote;
import java.rmi.RemoteException;
import webridge.common.offline.compiler.config.DBConfig;
import webridge.common.spring.filter.TraceRecordingFilter;

public interface TraceCompiler extends Remote {
  TraceCompiledResult compileTrace(
      TraceRecordingFilter.WeBridgeRecordedTrace trace, DBConfig DBConfig) throws RemoteException;
}
