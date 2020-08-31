import 'package:flutter/material.dart';

class StackActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StackActivityState();
}

class StackActivityState extends State<StackActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Stack",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Positioned(child: Text("Top left")),
          Positioned(right: 12, top: 0, child: Text("Top right with margin")),
          Positioned(right: 0, bottom: 0, child: Text("Bottom right")),
          Positioned(left: 0, bottom: 0, child: Text("Bottom left")),
          Positioned(
              left: 0,
              top: 24,
              child: Container(
                width: 54,
                height: 54,
                color: Colors.red,
              )),
          Positioned(
              left: 0,
              top: 24,
              child: Container(
                width: 32,
                height: 32,
                color: Colors.blue,
              )),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 72,
              height: 72,
              color: Colors.green,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 72,
              height: 72,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
