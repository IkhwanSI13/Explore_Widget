import 'package:explore_widget/commons/myButton.dart';
import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animationActivity.dart';

class MyAnimatedContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAnimatedContainer();
}

class _MyAnimatedContainer extends State<MyAnimatedContainer> {
  var colors = Colors.purple;
  var myWidth = 120.0;
  var myHeight = 120.0;
  var myPadding = 8.0;
  var myDecoration = BoxDecoration(color: Colors.green);
  var myDecoration2 =
      BoxDecoration(color: Colors.purple, shape: BoxShape.rectangle);
  var decorationOne = BoxDecoration(color: Colors.blue, shape: BoxShape.circle);

  initData() {
    setState(() {
      colors = Colors.purple;
      myWidth = 120.0;
      myHeight = 120.0;
      myPadding = 8.0;
      myDecoration = BoxDecoration(color: Colors.green);
      myDecoration2 =
          BoxDecoration(color: Colors.purple, shape: BoxShape.rectangle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: MySubTitle(
                "AnimatedContainer",
                color: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(
              width: 145,
              child: MyButton("Refresh", () {
                initData();
              }),
            )
          ],
        ),
        Container(
          margin: contentMargin,
          child: Wrap(
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    colors = Colors.red;
                  });
                },
                child: AnimatedContainer(
                  color: colors,
                  duration: Duration(seconds: 1),
                  child: Container(
                    width: 120,
                    height: 120,
                    child: Center(
                      child: Text("Click Me"),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    myWidth = 240.0;
                    myHeight = 240.0;
                  });
                },
                child: AnimatedContainer(
                  color: Colors.orange,
                  width: myWidth,
                  height: myHeight,
                  duration: Duration(seconds: 1),
                  child: Container(
                      width: 120,
                      height: 120,
                      child: Center(
                        child: Text("Click Me"),
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    myPadding = 16.0;
                  });
                },
                child: AnimatedContainer(
                  color: Colors.red,
                  padding: EdgeInsets.all(myPadding),
                  duration: Duration(seconds: 1),
                  child: Container(
                      width: 120,
                      height: 120,
                      child: Center(
                        child: Text("Click Me"),
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    myDecoration = BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.yellow, width: 12),
                    );
                  });
                },
                child: AnimatedContainer(
                  decoration: myDecoration,
                  duration: Duration(seconds: 1),
                  child: Container(
                      width: 120,
                      height: 120,
                      child: Center(
                        child: Text("Click Me"),
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    myDecoration2 = BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    );
                  });
                },
                child: AnimatedContainer(
                  decoration: myDecoration2,
                  duration: Duration(seconds: 1),
                  child: Container(
                      width: 120,
                      height: 120,
                      child: Center(
                        child: Text("Click Me"),
                      )),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
