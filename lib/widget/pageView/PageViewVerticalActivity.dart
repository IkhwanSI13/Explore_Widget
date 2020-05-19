import 'package:flutter/material.dart';

class PageViewVerticalActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PageViewVerticalActivityState();
}

class PageViewVerticalActivityState extends State<PageViewVerticalActivity> {
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
            Container(
              child: Text(
                "Vertical",
                style: TextStyle(fontSize: 18),
              ),
              margin: EdgeInsets.fromLTRB(24, 48, 24, 24),
            ),
            Expanded(
                child: PageView(
                    controller: pageController,
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                  Container(
                      color: Colors.red,
                      child: Center(
                          child:
                              Text("Page 1", style: TextStyle(fontSize: 24)))),
                  Container(
                      color: Colors.yellow,
                      child: Center(
                          child:
                              Text("Page 2", style: TextStyle(fontSize: 24)))),
                  Container(
                      color: Colors.green,
                      child: Center(
                          child:
                              Text("Page 3", style: TextStyle(fontSize: 24))))
                ]))
          ]));
}
