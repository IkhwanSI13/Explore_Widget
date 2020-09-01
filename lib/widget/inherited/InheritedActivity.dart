import 'package:flutter/material.dart';

class TextColor extends InheritedWidget {
  const TextColor({
    Key key,
    @required this.colorPrimary,
    @required Widget child,
  })  : assert(colorPrimary != null),
        assert(child != null),
        super(key: key, child: child);

  final Color colorPrimary;

  static TextColor of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TextColor>();
  }

  @override
  bool updateShouldNotify(TextColor old) => colorPrimary != old.colorPrimary;
}

class InheritedWidgetActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "InheritedWidget",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: TextColor(colorPrimary: Colors.red, child: ChildOneActivity()),
    );
  }
}

class ChildOneActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textColor = TextColor.of(context);

    return Column(
      children: [
        Text(
          "Child One",
          style: TextStyle(color: textColor.colorPrimary),
        ),
        ChildTwoActivity()
      ],
    );
  }
}

class ChildTwoActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textColor = TextColor.of(context);

    return Column(
      children: [
        Text(
          "Child Two",
          style: TextStyle(color: textColor.colorPrimary),
        ),
        ChildThreeActivity()
      ],
    );
  }
}

class ChildThreeActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textColor = TextColor.of(context);

    return Column(
      children: [
        Text(
          "Child Three",
          style: TextStyle(color: textColor.colorPrimary),
        )
      ],
    );
  }
}
