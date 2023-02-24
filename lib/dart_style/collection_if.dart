import 'package:flutter/material.dart';

class CollectionIf extends StatelessWidget {
  CollectionIf({super.key});

  final number = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// If you are inside a Row or Column, you can just use the
        /// collection-if operator.
        if (number == 2) ...[
          Container(),
          Container(),
          Container(),
        ],
        Container()
      ],
    );
  }
}
