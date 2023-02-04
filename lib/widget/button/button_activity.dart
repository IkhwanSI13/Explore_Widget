import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//MaterialApp(
//   theme: ThemeData.from(colorScheme: ColorScheme.light()).copyWith(
//     textButtonTheme: TextButtonThemeData(style: flatButtonStyle),
//     elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle),
//     outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
//   ),
// )

class ButtonActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            //TextButtonTheme
            onPressed: () {
              print("===> enter TextButton");
            },
            child: Text('TextButton'),
          ),
          TextButton(
            //TextButtonTheme
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.green),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Colors.black.withOpacity(0.04);
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed))
                    return Colors.red.withOpacity(0.12);
                  return Colors.blue; // Defer to the widget's default.
                },
              ),
            ),
            onPressed: () {
              print("===> enter TextButton with theme");
            },
            child: Text('Custom TextButton 1'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              backgroundColor: Colors.red,
              shadowColor: Colors.green,
              elevation: 4.0,
              minimumSize: Size(88, 36),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
              ),
            ),
            onPressed: () {
              print("===> enter TextButton with theme");
            },
            child: Text('Custom TextButton 2'),
          ),

          ///
          ElevatedButton(
            onPressed: () {
              print("===> enter ElevatedButton");
            },
            child: Text('ElevatedButton'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.blue,
              backgroundColor: Colors.red,
              minimumSize: Size(88, 36),
              padding: EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
            onPressed: () {
              print("===> enter ElevatedButton");
            },
            child: Text('Custom ElevatedButton'),
          ),

          ///
          OutlinedButton(
            //OutlinedButtonTheme
            onPressed: () {
              print("===> enter OutlinedButton");
            },
            child: Text('Custom OutlinedButton'),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              backgroundColor: Colors.red,
              minimumSize: Size(88, 36),
              padding: EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ).copyWith(
              side: MaterialStateProperty.resolveWith<BorderSide>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    );
                  return BorderSide();
                },
              ),
            ),
            onPressed: () {
              print("===> enter OutlinedButton");
            },
            child: Text('Custom OutlinedButton 1'),
          ),
        ],
      ),
    ));
  }
}
