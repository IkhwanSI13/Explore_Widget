import 'package:explore_widget/widget/loaders/colorLoader.dart';
import 'package:explore_widget/widget/loaders/colorLoader2.dart';
import 'package:explore_widget/widget/loaders/colorLoader3.dart';
import 'package:explore_widget/widget/loaders/colorLoader4.dart';
import 'package:explore_widget/widget/loaders/colorLoader5.dart';
import 'package:explore_widget/widget/loaders/dotType.dart';
import 'package:flutter/material.dart';

/**
 * Animation can make other widget repaint itself
 * Check it with place "debugRepaintRainbowEnabled = true"
 *    before runApp at main.dart
 * If the border color changes, use RepaintBoundary as parent widget of
 *    animation widget
 * RepaintBoundary has a small CPU and memory cost, so be careful using it
 * */

class RepaintBoundaryActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RepaintBoundaryState();
}

class RepaintBoundaryState extends State<RepaintBoundaryActivity> {
  @override
  Widget build(BuildContext context) {
    print("Ikhwan build");
    List<Color> colors = [];
    colors.add(Colors.red);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RepaintBoundary",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 24,
            ),
            RepaintBoundary(
              child: ColorLoader3(
                radius: 15,
                dotRadius: 6,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            RepaintBoundary(
              child: ColorLoader5(
                dotOneColor: Colors.red,
                dotTwoColor: Colors.blue,
                dotThreeColor: Colors.green,
                dotType: DotType.diamond, //another
              ),
            ),
          ],
        ),
      ),
    );
  }
}
