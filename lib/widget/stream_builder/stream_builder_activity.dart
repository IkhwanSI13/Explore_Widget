import 'package:flutter/material.dart';

class StreamBuilderActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StreamBuilderActivityState();
}

class StreamBuilderActivityState extends State<StreamBuilderActivity> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text("StreamBuilder"),),
//      body: ,
//    );
//  }

  Stream<int> _bids = (() async* {
    await Future<void>.delayed(Duration(seconds: 2));
    yield 1;
    await Future<void>.delayed(Duration(seconds: 2));
  })();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StreamBuilder"),
      ),
      body: Center(
        child: getStreamWithValueApproach(),
        //child: getStreamWithConnectivityState(),
      ),
    );
  }

  Widget getStreamWithValueApproach() => StreamBuilder<int>(
        stream: _bids,
        initialData: 20,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          List<Widget> children;
          children = <Widget>[
            Text('Default'),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('initialData: \$${snapshot.data}'),
            )
          ];

          if (snapshot.hasError) {
            children = <Widget>[Text('snapshot.hasError: ${snapshot.error}')];
          } else if (snapshot.hasData) {
            children = <Widget>[Text('snapshot.hasData: ${snapshot.data}')];
            //initial value will show first
            //after the stream task done, the value will change
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          );
        },
      );

  Widget getStreamWithConnectivityState() => StreamBuilder<int>(
        stream: _bids,
        initialData: 20,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          List<Widget> children;
          children = <Widget>[
            Text('Default'),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('initialData: \$${snapshot.data}'),
            )
          ];

          if (snapshot.hasError) {
            children = <Widget>[Text('snapshot.hasError: ${snapshot.error}')];
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                children = <Widget>[Text('ConnectionState.none\nSelect a lot')];
                break;
              case ConnectionState.waiting:
                children = <Widget>[
                  SizedBox(
                    child: const CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('ConnectionState.waiting\nWaiting'),
                  )
                ];
                break;
              case ConnectionState.active:
                children = <Widget>[Text('ConnectionState.active')];
                break;
              case ConnectionState.done:
                children = <Widget>[
                  Text('ConnectionState.done\nSelect a lot'),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('snapshot.data: \$${snapshot.data}'),
                  )
                ];
                break;
            }
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          );
        },
      );
}
