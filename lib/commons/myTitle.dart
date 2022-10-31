import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  final String title;
  final EdgeInsets? margin;

  MyTitle(this.title, {this.margin, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
      color: Colors.greenAccent,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}

class MySubTitle extends StatelessWidget {
  final String title;
  final EdgeInsets? margin;
  final Color? color;

  MySubTitle(this.title, {this.margin, this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      color: color ?? Colors.yellowAccent,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
    );
  }
}
