import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animation_activity.dart';

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
