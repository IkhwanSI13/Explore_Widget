import 'package:flutter/material.dart';

class SliverAppBarActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SliverAppBarActivityState();
}

class SliverAppBarActivityState extends State<SliverAppBarActivity> {
  @override
  Widget build(BuildContext context) {

    //combination for floating, pinned and snap value
    //https://api.flutter.dev/flutter/material/SliverAppBar-class.html

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              floating: true,
              pinned: false,
              snap: true,
              expandedHeight: 150.0,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('Available seats'),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_circle),
                  tooltip: 'Add new entry',
                  onPressed: () {
                    /* ... */
                  },
                ),
              ]),
          SliverList(
            delegate: SliverChildListDelegate([
              getContainerOne(),
              getContainerTwo(),
              getContainerOne(),
              getContainerTwo(),
              getContainerOne(),
              getContainerTwo(),
              getContainerOne(),
              getContainerTwo(),
              getContainerOne(),
              getContainerTwo()
            ]),
          )
        ],
      ),
    );
  }

  Widget getContainerOne() => Container(
        height: 220,
        color: Colors.red,
      );

  Widget getContainerTwo() => Container(
        height: 220,
        color: Colors.green,
      );
}
