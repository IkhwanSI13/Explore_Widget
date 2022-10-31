import 'package:explore_widget/commons/myButton.dart';
import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

final EdgeInsets contentMargin = EdgeInsets.symmetric(
  vertical: 18,
  horizontal: 24,
);

class AnimationActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationActivityState();
}

class _AnimationActivityState extends State<AnimationActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 24.0,
          bottom: 72.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MyTitle("Implicit Animations"),
            MySubTitle(
              "AnimatedFoo widgets",
              margin: EdgeInsets.only(
                top: 4,
                bottom: 8,
              ),
            ),
            ..._getAnimatedFooWidgets(context),
          ],
        ),
      ),
    );
  }

  List<Widget> _getAnimatedFooWidgets(BuildContext context) => [
        MyAnimatedAlign(),
        MyAnimatedContainer(),
        MyAnimatedDefaultTextStyle(),
        MyAnimatedOpacity(),
        MyAnimatedPadding(),
        MyAnimatedPhysicalModel(),
        MyAnimatedPositioned(),
        MyAnimatedPositionedDirectional(),
        MyAnimatedSize(),
      ];
}

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
