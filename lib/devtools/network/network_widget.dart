import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class NetworkWidget extends StatelessWidget {
  NetworkWidget({Key? key}) : super(key: key);

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
                request();
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

  void request() async {
    final dio = Dio();
    dio.get('https://api.github.com/users');
  }
}
