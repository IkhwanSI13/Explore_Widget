import 'package:flutter/material.dart';

class AnimatedActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AnimatedActivityState();
}

class AnimatedActivityState extends State<AnimatedActivity> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Animated",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              initData();
            },
          ),
        ],
      ),
      body: Wrap(
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
                  //shape: BoxShape.circle,
                  color: Colors.blue,
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
    );
  }
}
