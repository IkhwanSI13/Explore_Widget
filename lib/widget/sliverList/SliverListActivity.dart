import 'package:flutter/material.dart';

class SliverListActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SliverListActivityState();
}

class SliverListActivityState extends State<SliverListActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SliverList & Grid"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          getSliverGridExtend(),
          getSliverGridCount(),
          getSliverChildBuilderDelegate(),
          getSliverListDelegate()
        ],
      ),
    );
  }

  Widget getSliverGridExtend() => SliverGrid.extent(
        //max width at child value
        maxCrossAxisExtent: 50,
        children: <Widget>[
          getSquare(Colors.redAccent),
          getSquare(Colors.deepOrangeAccent),
          getSquare(Colors.grey),
          getSquare(Colors.greenAccent),
          getSquare(Colors.blue),
          getSquare(Colors.yellow),
          getSquare(Colors.red),
          getSquare(Colors.pink),
          getSquare(Colors.deepPurple),
          getSquare(Colors.orange),
        ],
      );

  Widget getSliverGridCount() => SliverGrid.count(
        crossAxisCount: 4,
        crossAxisSpacing: 2.0,
        children: <Widget>[
          getSquare(Colors.redAccent),
          getSquare(Colors.deepOrangeAccent),
          getSquare(Colors.grey),
          getSquare(Colors.greenAccent),
          getSquare(Colors.blue),
          getSquare(Colors.yellow),
          getSquare(Colors.red),
          getSquare(Colors.pink),
          getSquare(Colors.deepPurple),
          getSquare(Colors.orange),
        ],
      );

  Widget getSquare(Color colors) => Container(
        color: colors,
        width: 80,
        height: 80,
      );

  Widget getSliverChildBuilderDelegate() => SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text("SliverChildBuilderDelegate"),
            ),
          );
        }, childCount: 3),
      );

  Widget getSliverListDelegate() => SliverList(
        delegate: SliverChildListDelegate([
          Container(
            height: 50,
            color: Colors.red,
            child: Center(
              child: Text("SliverChildListDelegate"),
            ),
          ),
          Container(
              height: 50,
              color: Colors.green,
              child: Center(
                child: Text("SliverChildListDelegate"),
              ))
        ]),
      );
}
