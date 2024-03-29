import 'package:flutter/material.dart';

class RowActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RowActivityState();
}

class RowActivityState extends State<RowActivity> {
  MainAxisAlignment configMainAxisAlignment = MainAxisAlignment.start;
  MainAxisSize configMainAxisSize = MainAxisSize.max;
  CrossAxisAlignment configCrossAxis = CrossAxisAlignment.center;
  VerticalDirection configVerticalDirection = VerticalDirection.down;
  TextDirection configText = TextDirection.ltr;
  TextBaseline configTextBaseline = TextBaseline.alphabetic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Row",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              showConfiguration();
            },
          ),
        ],
      ),
      body: Container(
        height: 300,
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: configMainAxisAlignment,
          mainAxisSize: configMainAxisSize,
          crossAxisAlignment: configCrossAxis,
          textDirection: configText,
          verticalDirection: configVerticalDirection,
          textBaseline: configTextBaseline,
          children: <Widget>[
            Container(
              width: 90,
              height: 90,
              color: Colors.redAccent,
              child: Center(
                child: Text("Hello"),
              ),
            ),
            Container(
              height: 150,
              color: Colors.blue,
              child: Center(
                child: Text("Hello"),
              ),
            ),
            Container(
              color: Colors.green,
              child: Text("Hello"),
            ),
            Container(
              width: 90,
              height: 90,
              color: Colors.yellow,
              child: Center(
                child: Text("Hello"),
              ),
            )
          ],
        ),
      ),
    );
  }

  ///START CONFIG
  List<MainAxisAlignment> listMainAxis = [
    MainAxisAlignment.start,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.center,
    MainAxisAlignment.end,
    MainAxisAlignment.spaceAround,
    MainAxisAlignment.spaceEvenly,
  ];

  List<MainAxisSize> listMainAxisSize = [MainAxisSize.min, MainAxisSize.max];

  List<CrossAxisAlignment> listCrossAxis = [
    CrossAxisAlignment.start,
    CrossAxisAlignment.end,
    CrossAxisAlignment.center,
    CrossAxisAlignment.baseline,
    CrossAxisAlignment.stretch
  ];

  List<TextDirection> listTextDirection = [
    TextDirection.ltr,
    TextDirection.rtl
  ];

  List<VerticalDirection> listVerticalDirection = [
    VerticalDirection.down,
    VerticalDirection.up
  ];

  List<TextBaseline> listTextBaseline = [
    TextBaseline.alphabetic,
    TextBaseline.ideographic
  ];

  showConfiguration() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Config'),
          content: SingleChildScrollView(
              child: ListBody(children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 16, top: 18, right: 16),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      DropdownButtonFormField<MainAxisAlignment>(
                        isExpanded: true,
                        hint: Text(
                          "MainAxisAlignment",
                        ),
                        value: configMainAxisAlignment,
                        onChanged: (MainAxisAlignment? newData) {
                          if (newData != null)
                            setState(() {
                              configMainAxisAlignment = newData;
                            });
                        },
                        items: listMainAxis
                            .map<DropdownMenuItem<MainAxisAlignment>>(
                                (MainAxisAlignment value) {
                          return DropdownMenuItem<MainAxisAlignment>(
                            value: value,
                            child: Container(
                              child: Text(value.toString()),
                            ),
                          );
                        }).toList(),
                      ),
                      DropdownButtonFormField<MainAxisSize>(
                        isExpanded: true,
                        hint: Text(
                          "MainAxisSize",
                        ),
                        value: configMainAxisSize,
                        onChanged: (MainAxisSize? newData) {
                          if (newData != null)
                            setState(() {
                              configMainAxisSize = newData;
                            });
                        },
                        items: listMainAxisSize
                            .map<DropdownMenuItem<MainAxisSize>>(
                                (MainAxisSize value) {
                          return DropdownMenuItem<MainAxisSize>(
                            value: value,
                            child: Container(
                              child: Text(value.toString()),
                            ),
                          );
                        }).toList(),
                      ),
                      DropdownButtonFormField<CrossAxisAlignment>(
                        isExpanded: true,
                        hint: Text(
                          "CrossAxisAlignment",
                        ),
                        value: configCrossAxis,
                        onChanged: (CrossAxisAlignment? newData) {
                          if (newData != null)
                            setState(() {
                              configCrossAxis = newData;
                            });
                        },
                        items: listCrossAxis
                            .map<DropdownMenuItem<CrossAxisAlignment>>(
                                (CrossAxisAlignment value) {
                          return DropdownMenuItem<CrossAxisAlignment>(
                            value: value,
                            child: Container(
                              child: Text(value.toString()),
                            ),
                          );
                        }).toList(),
                      ),
                      DropdownButtonFormField<TextDirection>(
                        isExpanded: true,
                        hint: Text(
                          "TextDirection",
                        ),
                        value: configText,
                        onChanged: (TextDirection? newData) {
                          if (newData != null)
                            setState(() {
                              configText = newData;
                            });
                        },
                        items: listTextDirection
                            .map<DropdownMenuItem<TextDirection>>(
                                (TextDirection value) {
                          return DropdownMenuItem<TextDirection>(
                            value: value,
                            child: Container(
                              child: Text(value.toString()),
                            ),
                          );
                        }).toList(),
                      ),
                      DropdownButtonFormField<VerticalDirection>(
                        isExpanded: true,
                        hint: Text(
                          "VerticalDirection",
                        ),
                        value: configVerticalDirection,
                        onChanged: (VerticalDirection? newData) {
                          if (newData != null)
                            setState(() {
                              configVerticalDirection = newData;
                            });
                        },
                        items: listVerticalDirection
                            .map<DropdownMenuItem<VerticalDirection>>(
                                (VerticalDirection value) {
                          return DropdownMenuItem<VerticalDirection>(
                            value: value,
                            child: Container(
                              child: Text(value.toString()),
                            ),
                          );
                        }).toList(),
                      ),
                      DropdownButtonFormField<TextBaseline>(
                        isExpanded: true,
                        hint: Text(
                          "TextBaseline",
                        ),
                        value: configTextBaseline,
                        onChanged: (TextBaseline? newData) {
                          if (newData != null)
                            setState(() {
                              configTextBaseline = newData;
                            });
                        },
                        items: listTextBaseline
                            .map<DropdownMenuItem<TextBaseline>>(
                                (TextBaseline value) {
                          return DropdownMenuItem<TextBaseline>(
                            value: value,
                            child: Container(
                              child: Text(value.toString()),
                            ),
                          );
                        }).toList(),
                      )
                    ]))
          ])),
          actions: <Widget>[
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
