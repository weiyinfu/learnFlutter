import "dart:convert";

void main() {
  var s = "https://weiyinfu.cn?one=two";
  var x = Uri.parse(s);
  print("""
  ${x.path}
  ${x.query}
  ${x.queryParameters}
  ${x.queryParametersAll}
  """);
  print(Uri.encodeComponent("one=two"));
  print(Uri.encodeQueryComponent("one=two"));
}
