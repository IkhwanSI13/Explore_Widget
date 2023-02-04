import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animation_activity.dart';

class MyAnimatedCrossFade extends StatefulWidget {
  @override
  State<MyAnimatedCrossFade> createState() => _MyAnimatedCrossFade();
}

class _MyAnimatedCrossFade extends State<MyAnimatedCrossFade> {
  bool _showFirstWidget = true;

  void _updateWidget() {
    setState(() {
      _showFirstWidget = !_showFirstWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "AnimatedCrossFade",
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => _updateWidget(),
              child: AnimatedCrossFade(
                duration: const Duration(seconds: 2),
                firstChild: const FlutterLogo(
                    style: FlutterLogoStyle.horizontal, size: 100.0),
                secondChild: const FlutterLogo(
                    style: FlutterLogoStyle.stacked, size: 100.0),
                crossFadeState: _showFirstWidget
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
