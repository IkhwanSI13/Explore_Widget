import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animation_activity.dart';

class MyDefaultTextStyleTransition extends StatefulWidget {
  @override
  State<MyDefaultTextStyleTransition> createState() =>
      _MyDefaultTextStyleTransitionState();
}

class _MyDefaultTextStyleTransitionState
    extends State<MyDefaultTextStyleTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  )..repeat(reverse: true);
  TextStyleTween _styleTween = TextStyleTween(
    begin: const TextStyle(
        fontSize: 50, color: Colors.blue, fontWeight: FontWeight.w900),
    end: const TextStyle(
        fontSize: 50, color: Colors.red, fontWeight: FontWeight.w400),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "DefaultTextStyleTransition",
          margin: EdgeInsets.only(bottom: 8),
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: DefaultTextStyleTransition(
            style: _styleTween.animate(_controller),
            child: const Text('Flutter'),
          ),
        ),
      ],
    );
  }
}
