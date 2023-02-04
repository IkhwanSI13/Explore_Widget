import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animationActivity.dart';

class MyAnimatedSize extends StatefulWidget {
  @override
  State<MyAnimatedSize> createState() => _MyAnimatedSize();
}

class _MyAnimatedSize extends State<MyAnimatedSize> {
  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 100.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "AnimatedSize",
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          // height: 170.0,
          child: GestureDetector(
            onTap: () => _updateSize(),
            child: Container(
              color: Colors.amberAccent,
              child: AnimatedSize(
                curve: Curves.easeIn,
                duration: const Duration(seconds: 1),
                child: FlutterLogo(size: _size),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
