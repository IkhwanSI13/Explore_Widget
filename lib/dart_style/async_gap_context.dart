import 'package:flutter/material.dart';

/// Do not use BuildContexts across async gaps
class AsyncGapContext extends StatefulWidget {
  AsyncGapContext({super.key});

  @override
  State<StatefulWidget> createState() {
    return AsyncGapContextState();
  }
}

class AsyncGapContextState extends State<AsyncGapContext> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await Future.delayed(Duration(seconds: 10));

        /// Check mounted first
        if (mounted) return;
        Navigator.of(context).pop();
      },
      child: Container(),
    );
  }
}
