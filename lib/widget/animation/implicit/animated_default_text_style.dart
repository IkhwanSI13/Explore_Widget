import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animationActivity.dart';

class MyAnimatedDefaultTextStyle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedDefaultTextStyle();
}

class _MyAnimatedDefaultTextStyle extends State<MyAnimatedDefaultTextStyle> {
  var selected = false;
  var textStyle1 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w900,
    fontSize: 24,
  );
  var textStyle2 = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w500,
    fontSize: 30,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "AnimatedDefaultTextStyle",
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: AnimatedDefaultTextStyle(
              child: Container(
                height: 100,
                color: Colors.green,
                child: Center(
                  child: Text("Flutter Animation"),
                ),
              ),
              style: selected ? textStyle2 : textStyle1,
              duration: Duration(milliseconds: 100),
            ),
          ),
        ),
      ],
    );
  }
}
