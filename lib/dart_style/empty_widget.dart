import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  EmptyWidget({super.key});

  final number = 2;

  @override
  Widget build(BuildContext context) {
    if(number == 2){
      return Text("Number 2");
    }

    /// Use 'SizedBox.shrink()' instead of empty 'Container'
    /// This is more performant
    return const SizedBox.shrink();
  }
}
