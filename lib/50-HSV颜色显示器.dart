import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "HSV显示器",
    home: Main(),
  ));
}

class Main extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<Main> {
  Color c = Color.fromARGB(255, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    var hsv = HSVColor.fromColor(c);
    print("${hsv} ${c}");
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          color: c,
        ),
        Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(children: [
              Row(children: [
                Text("红色(R)"),
                Slider(
                    value: c.red.toDouble(),
                    min: 0,
                    max: 256,
                    onChanged: (v) {
                      c = c.withRed(v.toInt());
                      setState(() {});
                    })
              ]),
              Row(
                children: [
                  Text("绿色(G)"),
                  Slider(
                      value: c.green.toDouble(),
                      min: 0,
                      max: 256,
                      onChanged: (v) {
                        c = c.withGreen(v.toInt());
                        setState(() {});
                      })
                ],
              ),
              Row(
                children: [
                  Text("蓝色(B)"),
                  Slider(
                      value: c.blue.toDouble(),
                      min: 0,
                      max: 256,
                      onChanged: (v) {
                        c = c.withBlue(v.toInt());
                        setState(() {});
                      }),
                ],
              ),
              Divider(),
              Row(children: [
                Text("色调(Hue)"),
                Slider(
                    value: hsv.hue.toDouble(),
                    min: 0,
                    max: 360,
                    onChanged: (v) {
                      c = hsv.withHue(v).toColor();
                      setState(() {});
                    })
              ]),
              Row(
                children: [
                  Text("饱和度(Saturation)"),
                  Slider(
                      value: hsv.saturation.toDouble(),
                      min: 0,
                      max: 1,
                      onChanged: (v) {
                        if (v == 0) return;
                        c = hsv.withSaturation(v).toColor();
                        setState(() {});
                      })
                ],
              ),
              Row(
                children: [
                  Text("明度(Value)"),
                  Slider(
                      value: hsv.value.toDouble(),
                      min: 0,
                      max: 1,
                      onChanged: (v) {
                        if (v == 0) return;
                        c = hsv.withValue(v).toColor();
                        setState(() {});
                      }),
                ],
              )
            ]))
      ],
    ));
  }
}
