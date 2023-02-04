import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animation_activity.dart';

class MyFadeTransition extends StatefulWidget {
  @override
  State<MyFadeTransition> createState() => _MyFadeTransitionState();
}

class _MyFadeTransitionState extends State<MyFadeTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

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
          "DecoratedBoxTransition",
          margin: EdgeInsets.only(bottom: 8),
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: FadeTransition(
            opacity: _controller,
            child: const Padding(
                padding: EdgeInsets.all(8),
                child: FlutterLogo(
                  size: 120,
                )),
          ),
        ),
      ],
    );
  }
}
