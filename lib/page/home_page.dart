import 'dart:async';
import 'dart:math';

import 'package:countup/countup.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color initalColor;
  Widget text;
  int greenTime;
  Timer t;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            if (initalColor == Colors.blue) {
              initState();
            } else if (initalColor == Colors.green) {
              text = Countup(
                  begin: 0,
                  end: (DateTime.now().millisecondsSinceEpoch - greenTime).toDouble(),
                  duration: Duration(seconds: 1),
                  sufix : " ms",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ));
              initalColor = Colors.blue;
            } else if (initalColor == Colors.red) {
              text = Text("To fast",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                  ));
              initalColor = Colors.blue;
              t.cancel();
            }
          });
        },
        child: Container(
            color: initalColor,
            child: Center(
                child: text
                ),
            ),
        ),
      );
  }

  @override
  void initState() {
    initalColor = Colors.red;
    text = Text("Wait for the green",
        style: TextStyle(
            color: Colors.white,
            fontSize: 30
        ));
    t = Timer(Duration(milliseconds: Random().nextInt(4200)), () {
      setState(() {
        initalColor = Colors.green;
        text = Text("Green",
            style: TextStyle(
                color: Colors.white,
                fontSize: 30
            ));
        greenTime = DateTime.now().millisecondsSinceEpoch;
      });
    });
  }
}
