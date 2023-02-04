import 'package:explore_widget/commons/myButton.dart';
import 'package:explore_widget/page_route.dart';
import 'package:flutter/material.dart';

class WrapActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Explore Widget",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MyButton("Wrap vertical", () {
              Navigator.of(context).pushNamed(linkWrapVertical);
            }),
            MyButton("Wrap horizontal", () {
              Navigator.of(context).pushNamed(linkWrapHorizontal);
            }),
          ],
        ),
      ),
    );
  }
}
