import 'package:flutter/material.dart';

class FadeInImageActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FadeInImageActivityState();
}

class FadeInImageActivityState extends State<FadeInImageActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FadeInImage"),
      ),
      body: FadeInImage.assetNetwork(
        fadeInDuration: Duration(seconds: 2),
        //type of animation
        fadeInCurve: Curves.fastOutSlowIn,
        width: 240,
        height: 240,
        placeholder: "assets/images/ic_yukngoding.png",
        image: "https://www.yukngoding.id/me/img/pp.jpg",
      ),
    );
  }
}
