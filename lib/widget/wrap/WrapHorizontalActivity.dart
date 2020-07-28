import 'package:flutter/material.dart';

class WrapHorizontalActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(
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
        ],
      ),
    );
  }
}
