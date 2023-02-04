import 'package:flutter/material.dart';

import '../animation_activity.dart';

class MyAnimatedBuilder extends StatefulWidget {
  const MyAnimatedBuilder({Key? key}) : super(key: key);

  @override
  State<MyAnimatedBuilder> createState() => _MyAnimatedBuilderState();
}

class _MyAnimatedBuilderState extends State<MyAnimatedBuilder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..repeat(reverse: true);
  late final _animation =
      Tween<double>(begin: 0, end: 0.2).animate(_controller);

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
          child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: const [Colors.purple, Colors.pink, Colors.yellow],
                    stops: [0, _controller.value, 1],
                  ),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white),
                ),
              );
            },
          ),
        ),
        Container(
          margin: contentMargin,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget? child) {
              return Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: const [Colors.purple, Colors.pink, Colors.yellow],
                    stops: [0, _animation.value, 1],
                  ),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.white),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
