import 'dart:math';

import 'package:flutter/material.dart';

class StatefulBuilderActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "StatefulBuilder",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StatefulBuilder(builder: (ctx, setState) {
              var randomNumber = Random().nextInt(100);
              return Column(
                children: [
                  Text("Number: ${randomNumber}"),
                  const SizedBox(
                    height: 32.0,
                  ),
                  TextButton(
                    child: Text("refresh"),
                    onPressed: () {
                      setState(() {
                        // Do Something
                      });
                    },
                  )
                ],
              );
            }),
            const SizedBox(
              height: 32.0,
            ),
            StatefulBuilder(builder: (ctx, setState) {
              var otherNumber = Random().nextInt(100);
              return Column(
                children: [
                  Text("Other Number: ${otherNumber}"),
                  const SizedBox(
                    height: 32.0,
                  ),
                  TextButton(
                    child: Text("refresh"),
                    onPressed: () {
                      setState(() {
                        // Do Something
                      });
                    },
                  )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
