import 'package:flutter/material.dart';

class FullExpandedActivity extends StatelessWidget {
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
            child: Container(
              color: Colors.blue,
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                height: 280,
                width: 80,
                color: Colors.amber,
              ),
              Expanded(
                child: Container(
                  height: 280,
                  color: Colors.black,
                ),
              ),
              Container(
                height: 280,
                width: 80,
                color: Colors.green,
              ),
            ],
          )
        ],
      ),
    );
  }
}
