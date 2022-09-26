import 'package:flutter/material.dart';

class LinearGradientActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 72.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.green,
                  Colors.blue,
                ],
              )),
            ),
            Container(
              height: 72.0,
              margin: EdgeInsets.only(top: 32),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.green,
                  Colors.blue,
                ],
                stops: [
                  0.1,
                  0.3,
                  0.7,
                ],
              )),
            ),
            Container(
              height: 172.0,
              margin: EdgeInsets.only(top: 32),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.green,
                  Colors.blue,
                ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )),
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                  ],
                ).createShader(bounds),
                child: Text(
                  "Hello from Linear Gradient",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
