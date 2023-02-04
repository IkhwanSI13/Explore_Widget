import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animation_activity.dart';

///Why do TweenAnimationBuilder and AnimatedBuilder have a child argument?
//https://codewithandrea.com/articles/flutter-animated-builder-child-widget-argument/
class MyTweenAnimationBuilder extends StatefulWidget {
  @override
  State<MyTweenAnimationBuilder> createState() => _MyTweenAnimationBuilder();
}

class _MyTweenAnimationBuilder extends State<MyTweenAnimationBuilder> {
  double targetValue = 24.0;
  Color _color = Colors.blue;
  double _currentSliderValue = 0;
  Color _colorSlider = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "TweenAnimationBuilder",
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          // height: 170.0,
          child: Column(
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: targetValue),
                duration: const Duration(seconds: 1),
                builder: (BuildContext context, double size, Widget? child) {
                  return IconButton(
                    iconSize: size,
                    color: Colors.blue,
                    icon: child!,
                    onPressed: () {
                      setState(() {
                        targetValue = targetValue == 24.0 ? 48.0 : 24.0;
                      });
                    },
                  );
                },
                child: const Icon(Icons.aspect_ratio),
              ),

              /// Tween<T extends Object?>
              /// ReverseTween<T extends Object?>
              /// ColorTween
              /// SizeTween
              /// RectTween
              /// IntTween
              /// StepTween
              /// ConstantTween
              /// CurveTween
              TweenAnimationBuilder<Color?>(
                tween: ColorTween(begin: Colors.red, end: _color),
                duration: const Duration(seconds: 1),
                builder: (BuildContext context, Color? color, Widget? child) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                    ),
                    child: child,
                    onPressed: () {
                      setState(() {
                        if (_color == Colors.green) {
                          _color = Colors.blue;
                        } else {
                          _color = Colors.green;
                        }
                      });
                    },
                  );
                },
                child: const Text("Change Color"),
              ),
              TweenAnimationBuilder<Color?>(
                tween: ColorTween(begin: Colors.red, end: _colorSlider),
                duration: const Duration(seconds: 1),
                builder: (BuildContext context, Color? color, Widget? child) {
                  return SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackShape: RectangularSliderTrackShape(),
                      trackHeight: 8.0,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    ),
                    child: Slider(
                      value: _currentSliderValue,
                      max: 100,
                      activeColor: color,
                      thumbColor: color,
                      onChanged: (value) {
                        setState(
                          () {
                            _currentSliderValue = value;
                            if (value >= 0 && value < 25) {
                              _colorSlider = Colors.red;
                            } else if (value >= 25 && value < 50) {
                              _colorSlider = Colors.orange;
                            } else if (value >= 50 && value < 75) {
                              _colorSlider = Colors.yellow;
                            } else if (value >= 75 && value <= 100) {
                              _colorSlider = Colors.green;
                            }
                          },
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
