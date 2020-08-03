import 'package:flutter/material.dart';

class FabOnlyActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FabOnlyActivityState();
}

class FabOnlyActivityState extends State<FabOnlyActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAB"),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print("Ikhwan FAB click");
        },
      ),
      body: Container(),
    );
  }
}
