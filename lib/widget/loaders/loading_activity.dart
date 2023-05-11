import 'package:explore_widget/widget/loaders/color_loader.dart';
import 'package:explore_widget/widget/loaders/color_loader2.dart';
import 'package:explore_widget/widget/loaders/color_loader3.dart';
import 'package:explore_widget/widget/loaders/color_loader4.dart';
import 'package:explore_widget/widget/loaders/color_loader5.dart';
import 'package:explore_widget/widget/loaders/dot_type.dart';
import 'package:flutter/material.dart';

class LoadingActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoadingActivityState();
}

class LoadingActivityState extends State<LoadingActivity> {
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [];
    colors.add(Colors.red);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Loading",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 24,
            ),
            ColorLoader(
              colors: colors,
              duration: Duration(microseconds: 1200),
            ),
            const SizedBox(
              height: 24,
            ),
            ColorLoader2(
              color1: Colors.red,
              color2: Colors.blue,
              color3: Colors.green,
            ),
            const SizedBox(
              height: 24,
            ),
            ColorLoader3(
              radius: 15,
              dotRadius: 6,
            ),
            const SizedBox(
              height: 24,
            ),
            ColorLoader4(
              dotOneColor: Colors.red,
              dotTwoColor: Colors.blue,
              dotThreeColor: Colors.green,
              dotType: DotType.square, //another
            ),
            const SizedBox(
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
