import 'package:flutter/material.dart';

class OpacityActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => OpacityActivityState();
}

class OpacityActivityState extends State<OpacityActivity> {
  double myOpacity = 1;
  double myOpacity2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("Opacity & Animated Opacity"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              myOpacity = 1;
              myOpacity2 = 1;
            });
          },
        ),
      ]),
      body: Wrap(
        children: <Widget>[
          Opacity(
            opacity: 1,
            child: Container(
              color: Colors.green,
              width: 120,
              height: 120,
              child: Center(
                child: Text("Opacity 1"),
              ),
            ),
          ),
          Opacity(
            opacity: 0.5,
            child: Container(
              color: Colors.red,
              width: 120,
              height: 120,
              child: Center(
                child: Text("Opacity 0.5"),
              ),
            ),
          ),
          Opacity(
            opacity: 0.0,
            child: Container(
              color: Colors.blue,
              width: 120,
              height: 120,
              child: Center(
                child: Text("Opacity 0.0"),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Image.asset(
                "assets/images/ic_yukngoding.png",
                width: 120,
                height: 120,
              ),
              Opacity(
                opacity: 0.5,
                child: Container(
                  color: Colors.blue,
                  width: 120,
                  height: 120,
                  child: Center(
                    child: Text("Opacity 0.5"),
                  ),
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              setState(() {
                myOpacity = 0.5;
              });
            },
            child: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: myOpacity,
              child: Container(
                color: Colors.yellow,
                width: 120,
                height: 120,
                child: Center(
                  child: Text("Click me\n1 to 0.5"),
                ),
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Image.asset(
                "assets/images/ic_yukngoding.png",
                width: 120,
                height: 120,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    myOpacity2 = 0.5;
                  });
                },
                child: AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: myOpacity2,
                  child: Container(
                    color: Colors.pink,
                    width: 120,
                    height: 120,
                    child: Center(
                      child: Text("Click me\n1 to 0.5"),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
