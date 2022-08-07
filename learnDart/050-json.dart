import 'dart:convert';

/*
* flutter不支持反射，所以不支持fastjson这样的动态绑定的库。
* 只能使用Map、dynamic这样的基本数据类型
* 模型与JSON的转换通常是通过代码生成来实现的
* */
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

void main() {
  var a = {
    "name": "weiyinfu",
    "age": 18,
  };
  print(jsonEncode(a));
  print(jsonDecode(jsonEncode(a)));
  var u = User("yinfu", "123");
  print(u.toJson());
  var s = json.encode(u.toJson());
  var uu = User.fromJson(json.decode(s));
  print(uu.toJson());
}
