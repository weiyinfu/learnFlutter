import 'dart:io';

void main() {
  for (var i = 1; i < 9; i++) {
    for (var j = 1; j <= i; j++) {
      //要想不换行，就只能使用stdout.write打印字符串
      stdout.write("$j*$i=${i * j} ");
    }
    stdout.writeln();
  }
}
