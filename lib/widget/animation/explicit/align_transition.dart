import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../../../commons/myButton.dart';
import '../animation_activity.dart';
import 'align_rotate_transition.dart';

class MyAlignTransition extends StatefulWidget {
  @override
  State<MyAlignTransition> createState() => _AlignTransitionState();
}

class _AlignTransitionState extends State<MyAlignTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_controller

        /// Use CurvedAnimation to get curved effect
        // CurvedAnimation(
        //   parent: _controller,
        //   curve: Curves.bounceInOut,
        // ),
        );
  }

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
          "AnimatedAlign",
          margin: EdgeInsets.only(bottom: 8),
          color: Colors.lightBlueAccent,
        ),
        Wrap(
          children: [
            SizedBox(
              width: 145,
              child: MyButton("forward", () {
                _controller.forward();
              }),
            ),
            SizedBox(
              width: 145,
              child: MyButton("reverse", () {
                _controller.reverse();
              }),
            ),
            SizedBox(
              width: 145,
              child: MyButton("stop", () {
                _controller.stop();
              }),
            ),
            SizedBox(
              width: 145,
              child: MyButton("repeat", () {
                _controller.repeat(reverse: true);
              }),
            ),
            SizedBox(
              width: 145,
              child: MyButton("reset", () {
                _controller.reset();
              }),
            ),
          ],
        ),
        Container(
          margin: contentMargin,
          child: AlignTransition(
            alignment: _alignAnimation,
            child: const Rectangle(
              color1: Colors.green,
              color2: Colors.blue,
              width: 50,
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
