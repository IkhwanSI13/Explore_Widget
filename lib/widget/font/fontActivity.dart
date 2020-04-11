import 'package:explore_widget/widget/form/user.dart';
import 'package:flutter/material.dart';

class FontActivity extends StatelessWidget {
  final String FontLato = 'FontLato';
  final String FontPoppins = 'FontPoppins';

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Font"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            "Sample Text - Standart",
            style: TextStyle(
              fontFamily: FontLato,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            "Sample Text - Italic",
            style: TextStyle(fontFamily: FontLato, fontStyle: FontStyle.italic),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            "Sample Text - Bold - FontWeight.w700",
            style: TextStyle(
                fontFamily: FontLato,
                fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            "Sample Text - Bold & italic - FontWeight.w700",
            style: TextStyle(
                fontFamily: FontLato,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            "Sample Text - Bold & italic - FontWeight.w900",
            style: TextStyle(
                fontFamily: FontLato,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900),
          ),
        ),
      ]));

}
