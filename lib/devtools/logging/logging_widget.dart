import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class LoggingWidget extends StatelessWidget {
  LoggingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Inspector Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                print('print: Submit button pressed.');
                debugPrint('debugPrint: Submit button pressed.');

                print(
                    'print: Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. 10x');
                debugPrint(
                    'debugPrint: Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. 10x');

                debugPrint(
                    'debugPrint: Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. Submit button pressed. 10x',
                    wrapWidth: 50);

                log("log: empty.");
                log(
                  "log: warning",
                  level: Level.WARNING.value,
                );
                log(
                  "log: shout",
                  level: Level.SHOUT.value,
                );
                log("log: name", name: "Ikhwan Koto");
              },
              child: const Text(
                'Submit',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
