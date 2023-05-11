import 'package:flutter/material.dart';

class Emoji extends StatelessWidget {
  const Emoji(this.icon, this.itemText, {super.key});
  final String icon;
  final String itemText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          icon,
          style: const TextStyle(
            fontSize: 30.0,
          ),
        ),
        Text(itemText),
      ],
    );
  }
}

class InspectorWidget extends StatelessWidget {
  const InspectorWidget({super.key});

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
            // Problem #1
            Row(
              children: const [
                Text(
                  'Please provide your valuable feedback by sharing your experience with us!',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),

            //Problem #2
            Row(
              children: const [
                Emoji('😀', 'Good'),
                Emoji('😐', 'Average'),
                Emoji('🙁', 'Bad'),
              ],
            ),

            // Problem #3
            Row(
              children: const [
                Divider(
                  color: Colors.black,
                ),
              ],
            ),

            // Problem #4
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    debugPrint('Submit button pressed.');
                  },
                  child: const Text(
                    'Submit',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
