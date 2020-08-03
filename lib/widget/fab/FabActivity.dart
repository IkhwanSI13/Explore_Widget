import 'package:explore_widget/mainActivity.dart';
import 'package:explore_widget/page_route.dart';
import 'package:flutter/material.dart';

class FabActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Fab",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            button("Fab Only", () {
              Navigator.of(context).pushNamed(linkFabOnly);
            }),
            button("Fab With BottomNav", () {
              Navigator.of(context).pushNamed(linkFabBottomNav);
            })
          ])));
}
