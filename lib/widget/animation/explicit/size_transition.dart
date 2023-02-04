import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../../../commons/myButton.dart';
import '../animation_activity.dart';

class MySizeTransition extends StatefulWidget {
  @override
  State<MySizeTransition> createState() => _MySizeTransition();
}

class _MySizeTransition extends State<MySizeTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
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
          "SizeTransition",
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
              child: MyButton("reset", () {
                _controller.reset();
              }),
            ),
          ],
        ),
        Container(
          margin: contentMargin,
          child: SizeTransition(
            sizeFactor: _animation,

            /// Use axis with flexible parent size.
            // We use CrossAxisAlignment.stretch on Column as parent,
            // so if we set the axis to Axis.horizontal, the animation will
            // not work
            axis: Axis.vertical,

            /// A positive value in this property will make the logo pop out
            // from top for Axis.vertical and left for Axis.horizontal
            // Opposite for negative value
            axisAlignment: 4,
            child: const Center(
              child: FlutterLogo(size: 200.0),
            ),
          ),
        ),
      ],
    );
  }
}
