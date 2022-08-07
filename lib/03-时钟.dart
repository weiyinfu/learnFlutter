import 'dart:async';

import 'package:flutter/material.dart';

class MyBody extends StatefulWidget {
  MyBody() {
    print("MyBody is constructed");
  }

  @override
  State<StatefulWidget> createState() {
    //这个函数在整个过程中只会执行一次
    print("before create state");
    return MyBodyState();
  }
}

class MyBodyState extends State<MyBody> {
  String text = DateTime.now().toString();
  Timer? timer = null;

  MyBodyState() {
    print("myBodyState is constructed");
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      text = DateTime.now().toString();
      print("haha ${text}");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build widget");
    return Text(
      text,
      textDirection: TextDirection.ltr,
    );
  }
}

void main() {
  print("before run app");
  runApp(Center(
    child: MyBody(),
  ));
}
