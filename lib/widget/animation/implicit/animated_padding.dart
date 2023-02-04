import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animation_activity.dart';

class MyAnimatedPadding extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedPadding();
}

class _MyAnimatedPadding extends State<MyAnimatedPadding> {
  var selected = false;
  final padding1 = EdgeInsets.all(16.0);
  final padding2 = EdgeInsets.all(0.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "AnimatedPadding",
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
            child: Container(
              color: Colors.red,
              child: AnimatedPadding(
                padding: selected ? padding1 : padding2,
                duration: const Duration(seconds: 1),
                child: Container(
                  height: 100,
                  color: Colors.green,
                  child: FlutterLogo(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
