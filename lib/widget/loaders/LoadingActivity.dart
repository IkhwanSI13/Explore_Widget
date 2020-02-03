import 'package:explore_widget/widget/loaders/colorLoader.dart';
import 'package:explore_widget/widget/loaders/colorLoader2.dart';
import 'package:explore_widget/widget/loaders/colorLoader3.dart';
import 'package:explore_widget/widget/loaders/colorLoader4.dart';
import 'package:explore_widget/widget/loaders/colorLoader5.dart';
import 'package:explore_widget/widget/loaders/dotType.dart';
import 'package:flutter/material.dart';

class LoadingActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoadingActivityState();
}

class LoadingActivityState extends State<LoadingActivity> {
  @override
  Widget build(BuildContext context) {
    List<Color> colors = List();
    colors.add(Colors.red);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Loading",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 24,
            ),
            ColorLoader(
              colors: colors,
              duration: Duration(microseconds: 1200),
            ),
            Container(
              height: 24,
            ),
            ColorLoader2(
              color1: Colors.red,
              color2: Colors.blue,
              color3: Colors.green,
            ),
            Container(
              height: 24,
            ),
            ColorLoader3(
              radius: 15,
              dotRadius: 6,
            ),
            Container(
              height: 24,
            ),
            ColorLoader4(
              dotOneColor: Colors.red,
              dotTwoColor: Colors.blue,
              dotThreeColor: Colors.green,
              dotType: DotType.square, //another
            ),
            Container(
              height: 24,
            ),
            ColorLoader5(
              dotOneColor: Colors.red,
              dotTwoColor: Colors.blue,
              dotThreeColor: Colors.green,
              dotType: DotType.diamond, //another
            ),
          ],
        ),
      ),
    );
  }
}
