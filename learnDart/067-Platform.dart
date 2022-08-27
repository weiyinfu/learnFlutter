import 'dart:io';

void main() {
  //环境变量
  print("""
  环境变量：${Platform.environment}
  PackageConfig=${Platform.packageConfig}
  PathSeperator=${Platform.pathSeparator}
  
  
  命令行：
  dart 可执行文件的路径 ${Platform.executable}
  dart version=${Platform.version}
  dart执行时的参数 ${Platform.executableArguments}
  script=${Platform.script}
  resolvedExecutable=${Platform.resolvedExecutable}
  
  
  操作系统：
  isAndroid=${Platform.isAndroid}
  isWindows=${Platform.isWindows}
  isFunshia=${Platform.isFuchsia}
  isIos=${Platform.isIOS}
  isLinux=${Platform.isLinux}
  isMac=${Platform.isMacOS}
  operatingSystem=${Platform.operatingSystem}
  operatingSystemVersion=${Platform.operatingSystemVersion}
  
  CPU核数：
  CPU Count=${Platform.numberOfProcessors}
  
  LocaleName=${Platform.localeName}
  LocalHostName=${Platform.localHostname}
  """);
}
