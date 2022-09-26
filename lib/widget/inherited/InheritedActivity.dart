import 'package:flutter/material.dart';

///Desc:
///https://www.yukngoding.id/2020/09/02/why-do-we-need-an-inheritedwidget-in-flutter-code/

class TextColor extends InheritedWidget {
  const TextColor({
    required this.colorPrimary,
    required Widget child,
  })  : assert(colorPrimary != null),
        assert(child != null),
        super(child: child);

  final Color colorPrimary;

  static TextColor? of(BuildContext context) {
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
      body: TextColor(colorPrimary: Colors.red, child: WidgetB()),
    );
  }
}

class WidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Child One",
        ),
        WidgetC()
      ],
    );
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textColor = TextColor.of(context);

    return Column(
      children: [
        Text(
          "Child Two",
          style: TextStyle(color: textColor?.colorPrimary),
        ),
        WidgetD()
      ],
    );
  }
}

class WidgetD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textColor = TextColor.of(context);

    return Column(
      children: [
        Text(
          "Child Three",
          style: TextStyle(color: textColor?.colorPrimary),
        )
      ],
    );
  }
}
