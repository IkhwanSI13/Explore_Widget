import 'package:flutter/material.dart';

class FunctionArgument extends StatelessWidget {
  FunctionArgument({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      /// use function name: 'doSomething' instead of '() => doSomething()'
      onTap: doSomething,
      child: Container(),
    );
  }

  void doSomething(){}
}
