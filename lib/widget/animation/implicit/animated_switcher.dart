import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animation_activity.dart';

class MyAnimatedSwitcher extends StatefulWidget {
  @override
  State<MyAnimatedSwitcher> createState() => _MyAnimatedSwitcher();
}

class _MyAnimatedSwitcher extends State<MyAnimatedSwitcher> {
  bool _refresh = true;
  late Widget _myWidget;

  @override
  void initState() {
    super.initState();
    _myWidget = Container(
      key: ValueKey<int>(0),
      width: 50,
      height: 80,
      color: Colors.lightBlueAccent,
      child: Center(
        child: Text("Naruto"),
      ),
    );
  }

  void _updateWidget() {
    setState(() {
      _refresh = !_refresh;
      if (_refresh) {
        _myWidget = Container(
          key: ValueKey<int>(1),
          width: 50,
          height: 80,
          color: Colors.lightBlueAccent,
          child: Center(
            child: Text("Naruto"),
          ),
        );
      } else {
        _myWidget = Container(
          key: ValueKey<int>(2),
          width: 100,
          height: 80,
          color: Colors.greenAccent,
          child: Center(
            child: Text("Sasuke"),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "AnimatedSwitcher",
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => _updateWidget(),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                switchInCurve: Curves.easeInQuart,
                switchOutCurve: Curves.easeOut,
                transitionBuilder: (child, animation) => ScaleTransition(
                  child: child,
                  // turns: animation,
                  scale: animation,
                ),
                child: _myWidget,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
