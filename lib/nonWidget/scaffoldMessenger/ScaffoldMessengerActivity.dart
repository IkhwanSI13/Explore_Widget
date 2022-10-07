import 'package:explore_widget/key.dart';
import 'package:flutter/material.dart';

class ScaffoldMessengerActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ScaffoldMessenger",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text("Show"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('A SnackBar has been shown.'),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 32.0,
            ),
            TextButton(
              child: Text("Show without context"),
              onPressed: () {
                scaffoldKey.currentState?.showSnackBar(
                  SnackBar(
                    content: Text('A SnackBar has been shown.'),
                    backgroundColor: Colors.green,
                    elevation: 2.0,
                    behavior: SnackBarBehavior.floating,
                    width: double.infinity,
                    // Width and margin can not be used together
                    //margin: EdgeInsets.symmetric(horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
