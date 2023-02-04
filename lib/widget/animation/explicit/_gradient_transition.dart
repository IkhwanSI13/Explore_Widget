import 'package:flutter/material.dart';

import '../animation_activity.dart';

class MyAnimatedWidget extends StatefulWidget {
  const MyAnimatedWidget({Key? key}) : super(key: key);

  @override
  State<MyAnimatedWidget> createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
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
        Container(
          margin: contentMargin,
          child: GradientTransition(stop: _controller),
        ),
      ],
    );
  }
}

class GradientTransition extends AnimatedWidget {
  final Animation<double> stop;

  const GradientTransition({
    Key? key,
    required this.stop,
  }) : super(key: key, listenable: stop);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [Colors.purple, Colors.pink, Colors.yellow],
          stops: [0, stop.value, 1],
        ),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white),
      ),
    );
  }
}

///
