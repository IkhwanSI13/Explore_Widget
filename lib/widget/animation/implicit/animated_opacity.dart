import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animationActivity.dart';

class MyAnimatedOpacity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedOpacity();
}

class _MyAnimatedOpacity extends State<MyAnimatedOpacity> {
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "AnimatedOpacity",
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: GestureDetector(
            onTap: () {
              setState(() {
                opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
              });
            },
            child: AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 1),
              child: Container(
                height: 100,
                color: Colors.green,
                child: FlutterLogo(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
