import 'package:flutter/material.dart';

class ClipRectActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ClipRect",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 72,
              height: 72,
              color: Colors.red,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), bottomRight: Radius.circular(12)),
            child: Container(
              width: 72,
              height: 72,
              color: Colors.yellow,
            ),
          ),
          ClipOval(
              child: Container(
            width: 72,
            height: 72,
            color: Colors.green,
          )),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 72,
              height: 72,
              child: Image.network("https://www.yukngoding.id/me/img/pp.jpg"),
            ),
          ),
          ClipOval(
              child: Container(
            width: 72,
            height: 72,
            child: Image.network("https://www.yukngoding.id/me/img/pp.jpg"),
          ))
        ],
      ),
    );
  }
}
