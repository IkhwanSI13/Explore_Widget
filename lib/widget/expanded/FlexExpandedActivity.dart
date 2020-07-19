import 'package:flutter/material.dart';

class FlexExpandedActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 280,
            color: Colors.red,
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
