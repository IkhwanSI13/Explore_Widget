import 'package:flutter/material.dart';

class SafeAreaActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        left: true,
        right: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 80,
              color: Colors.red,
            ),
            Expanded(
              child: Container(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
