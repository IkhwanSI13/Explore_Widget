import 'package:flutter/material.dart';

class TooltipActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tooltip",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Tooltip(
            message: "It is red",
            child: Container(
              width: 172,
              height: 172,
              color: Colors.red,
              child: Text("Long click at me"),
            ),
          ),
          Tooltip(
            message: "It is another tooltip",
            padding: EdgeInsets.all(12),
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
            child: Container(
              width: 172,
              height: 172,
              color: Colors.green,
              child: Text("Long click at me"),
            ),
          )
        ],
      ),
    );
  }
}
