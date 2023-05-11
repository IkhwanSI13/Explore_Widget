import 'package:flutter/material.dart';

class MemoryLeakObject {
  final String text;

  MemoryLeakObject(this.text);
}

List<MemoryLeakObject> leakObjects = [];

class MemoryWidget extends StatelessWidget {
  const MemoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text(
            'Add 1M Leaky Objects',
          ),
          onPressed: () {
            var i = 0;
            while (i < 1000000) {
              leakObjects.add(
                MemoryLeakObject('Id: ${leakObjects.length}'),
              );
              i++;
            }
          },
        ),
      ),
    );
  }
}