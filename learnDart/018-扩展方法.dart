/*
* 类似C#中的扩展方法
* */
extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }
// ···
}

void main() {
  print("314".parseInt());
}
