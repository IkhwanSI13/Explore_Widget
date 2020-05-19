import 'package:explore_widget/page_route.dart';
import 'package:explore_widget/widget/main/mainActivity.dart';
import 'package:flutter/material.dart';

class PageViewActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
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
            button("PageView Vertical", () {
              Navigator.of(context).pushNamed(linkPageViewVertical);
            }),
            button("PageView Horizontal", () {
              Navigator.of(context).pushNamed(linkPageViewHorizontal);
            })
          ])));
}
