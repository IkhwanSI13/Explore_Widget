import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animation_activity.dart';

/// Use start and end property instead of left and right
class MyAnimatedPositionedDirectional extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedPositionedDirectional();
}

class _MyAnimatedPositionedDirectional
    extends State<MyAnimatedPositionedDirectional> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "AnimatedPositionedDirectional",
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          height: 170.0,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Positioned(
                bottom: 35,
                left: 25,
                right: 25,
                child: Center(
                  child: Text(
                    "Halloo",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              AnimatedPositionedDirectional(
                top: _selected ? 0 : 70,
                bottom: _selected ? 70 : 25,
                start: 20,
                end: _selected ? 70 : 25,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selected = !_selected;
                    });
                  },
                  child: Container(
                    height: 80,
                    width: 120,
                    color: Colors.green,
                  ),
                ),
                duration: Duration(milliseconds: 500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
