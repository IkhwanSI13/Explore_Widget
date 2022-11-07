part of "animationActivity.dart";

class MyAnimatedAlign extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedAlign();
}

class _MyAnimatedAlign extends State<MyAnimatedAlign> {
  bool selectedAlign = false;

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
        Container(
          margin: contentMargin,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedAlign = !selectedAlign;
              });
            },
            child: Container(
              height: 120.0,
              color: Colors.red,
              child: AnimatedAlign(
                alignment:
                    selectedAlign ? Alignment.topRight : Alignment.bottomLeft,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: const FlutterLogo(size: 50.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyAnimatedContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedContainer();
}

class _MyAnimatedContainer extends State<MyAnimatedContainer> {
  var colors = Colors.purple;
  var myWidth = 120.0;
  var myHeight = 120.0;
  var myPadding = 8.0;
  var myDecoration = BoxDecoration(color: Colors.green);
  var myDecoration2 =
      BoxDecoration(color: Colors.purple, shape: BoxShape.rectangle);
  var decorationOne = BoxDecoration(color: Colors.blue, shape: BoxShape.circle);

  initData() {
    setState(() {
      colors = Colors.purple;
      myWidth = 120.0;
      myHeight = 120.0;
      myPadding = 8.0;
      myDecoration = BoxDecoration(color: Colors.green);
      myDecoration2 =
          BoxDecoration(color: Colors.purple, shape: BoxShape.rectangle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: MySubTitle(
                "AnimatedContainer",
                color: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(
              width: 145,
              child: MyButton("Refresh", () {
                initData();
              }),
            )
          ],
        ),
        Container(
          margin: contentMargin,
          child: Wrap(
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    colors = Colors.red;
                  });
                },
                child: AnimatedContainer(
                  color: colors,
                  duration: Duration(seconds: 1),
                  child: Container(
                    width: 120,
                    height: 120,
                    child: Center(
                      child: Text("Click Me"),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    myWidth = 240.0;
                    myHeight = 240.0;
                  });
                },
                child: AnimatedContainer(
                  color: Colors.orange,
                  width: myWidth,
                  height: myHeight,
                  duration: Duration(seconds: 1),
                  child: Container(
                      width: 120,
                      height: 120,
                      child: Center(
                        child: Text("Click Me"),
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    myPadding = 16.0;
                  });
                },
                child: AnimatedContainer(
                  color: Colors.red,
                  padding: EdgeInsets.all(myPadding),
                  duration: Duration(seconds: 1),
                  child: Container(
                      width: 120,
                      height: 120,
                      child: Center(
                        child: Text("Click Me"),
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    myDecoration = BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.yellow, width: 12),
                    );
                  });
                },
                child: AnimatedContainer(
                  decoration: myDecoration,
                  duration: Duration(seconds: 1),
                  child: Container(
                      width: 120,
                      height: 120,
                      child: Center(
                        child: Text("Click Me"),
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    myDecoration2 = BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    );
                  });
                },
                child: AnimatedContainer(
                  decoration: myDecoration2,
                  duration: Duration(seconds: 1),
                  child: Container(
                      width: 120,
                      height: 120,
                      child: Center(
                        child: Text("Click Me"),
                      )),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MyAnimatedDefaultTextStyle extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedDefaultTextStyle();
}

class _MyAnimatedDefaultTextStyle extends State<MyAnimatedDefaultTextStyle> {
  var selected = false;
  var textStyle1 = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w900,
    fontSize: 24,
  );
  var textStyle2 = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w500,
    fontSize: 30,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "AnimatedDefaultTextStyle",
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: AnimatedDefaultTextStyle(
              child: Container(
                height: 100,
                color: Colors.green,
                child: Center(
                  child: Text("Flutter Animation"),
                ),
              ),
              style: selected ? textStyle2 : textStyle1,
              duration: Duration(milliseconds: 100),
            ),
          ),
        ),
      ],
    );
  }
}

///
class MyAnimatedOpacity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedOpacity();
}

class _MyAnimatedOpacity extends State<MyAnimatedOpacity> {
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "AnimatedOpacity",
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: GestureDetector(
            onTap: () {
              setState(() {
                opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
              });
            },
            child: AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 1),
              child: Container(
                height: 100,
                color: Colors.green,
                child: FlutterLogo(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///
class MyAnimatedPadding extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedPadding();
}

class _MyAnimatedPadding extends State<MyAnimatedPadding> {
  var selected = false;
  final padding1 = EdgeInsets.all(16.0);
  final padding2 = EdgeInsets.all(0.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "AnimatedPadding",
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: Container(
              color: Colors.red,
              child: AnimatedPadding(
                padding: selected ? padding1 : padding2,
                duration: const Duration(seconds: 1),
                child: Container(
                  height: 100,
                  color: Colors.green,
                  child: FlutterLogo(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///
class MyAnimatedPhysicalModel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedPhysicalModel();
}

class _MyAnimatedPhysicalModel extends State<MyAnimatedPhysicalModel> {
  bool _selected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "AnimatedPhysicalModel",
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selected = !_selected;
              });
            },
            child: AnimatedPhysicalModel(
              shape: BoxShape.rectangle,
              elevation: _selected ? 6.0 : 12.0,
              color: _selected ? Colors.green : Colors.black,
              shadowColor: _selected ? Colors.red : Colors.blue,
              duration: const Duration(seconds: 1),
              child: Container(
                height: 150,
                child: FlutterLogo(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyAnimatedPositioned extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedPositioned();
}

class _MyAnimatedPositioned extends State<MyAnimatedPositioned> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "AnimatedPositioned",
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          alignment: AlignmentDirectional.bottomEnd,
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
              AnimatedPositioned(
                top: _selected ? 0 : 70,
                bottom: _selected ? 70 : 25,
                left: 25,
                right: _selected ? 55 : 25,
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

///
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

///
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
