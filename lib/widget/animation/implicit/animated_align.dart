import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animationActivity.dart';

class MyAnimatedAlign extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedAlign();
}

class _MyAnimatedAlign extends State<MyAnimatedAlign> {
  bool selectedAlign = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "AnimatedAlign",
          margin: EdgeInsets.only(bottom: 8),
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedAlign = !selectedAlign;
              });
            },
            child: Container(
              height: 120.0,
              color: Colors.red,
              child: AnimatedAlign(
                alignment:
                    selectedAlign ? Alignment.topRight : Alignment.bottomLeft,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: const FlutterLogo(size: 50.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
