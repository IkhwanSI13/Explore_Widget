import 'package:flutter/material.dart';

class WrapVerticalActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
        direction: Axis.vertical,
        spacing: 12,
        children: <Widget>[
          Container(
            height: 90,
            width: 90,
            color: Colors.red,
          ),
          Container(
            height: 90,
            width: 90,
            color: Colors.blue,
          ),
          Container(
            height: 90,
            width: 90,
            color: Colors.green,
          ),
          Container(
            height: 90,
            width: 90,
            color: Colors.black,
          ),
          Container(
            height: 90,
            width: 90,
            color: Colors.green,
          ),
          Container(
            height: 90,
            width: 90,
            color: Colors.yellow,
          ),
          Container(
            height: 90,
            width: 90,
            color: Colors.purple,
          ),
          Container(
            height: 90,
            width: 90,
            color: Colors.black,
          ),
          Container(
            height: 90,
            width: 90,
            color: Colors.orangeAccent,
          ),
          Container(
            height: 90,
            width: 90,
            color: Colors.yellow,
          ),
        ],
      ),
    );
    ;
  }
}
