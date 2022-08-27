void main() {
  num.parse("32");
  print(num.parse("1.234") is double);
  int.parse("01234343", radix: 5); //五进制
  "helloworld".startsWith("hello");
  "    one     two    three     ".split(RegExp("\\s+")).where((element) => element.length > 0).forEach((element) {
    print("#$element#");
  });
}
