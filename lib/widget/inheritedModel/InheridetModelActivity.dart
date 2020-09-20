import 'package:flutter/material.dart';

String textOne = "Text1";
String textTwo = "Text2";

class TextColor extends InheritedModel<String> {
  const TextColor({
    @required this.colorPrimary,
    @required this.colorSecondary,
    @required Widget child,
  })  : assert(colorPrimary != null),
        assert(colorSecondary != null),
        assert(child != null),
        super(child: child);

  final Color colorPrimary;
  final Color colorSecondary;

  static TextColor of(BuildContext context, String aspect) {
    return InheritedModel.inheritFrom<TextColor>(context, aspect: aspect);
  }

  @override
  bool updateShouldNotify(TextColor old) =>
      colorPrimary != old.colorPrimary || colorSecondary != old.colorSecondary;

  @override
  bool updateShouldNotifyDependent(
      TextColor oldWidget, Set<String> dependencies) {
    return (colorPrimary != oldWidget.colorPrimary &&
            dependencies.contains(textOne)) ||
        (colorSecondary != oldWidget.colorSecondary &&
            dependencies.contains(textTwo));
  }
}

class InheritedModelActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InheritedModelActivityState();
}

class InheritedModelActivityState extends State<InheritedModelActivity> {
  var colorsPrimary = Colors.purple;
  var colorsSecondary = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited Model"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 136),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextColor(
                colorPrimary: colorsPrimary,
                colorSecondary: colorsSecondary,
                child: const WidgetB()),
            GestureDetector(
              onTap: () {
                setState(() {
                  print("YukNgoding change colorPrimary");
                  colorsPrimary = Colors.red;
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 72, bottom: 12),
                padding: EdgeInsets.all(12),
                child: Text("Refresh Color Primary"),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  print("YukNgoding change colorSecondary");
                  colorsSecondary = Colors.green;
                });
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(12),
                child: Text("Refresh Color Secondary"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB();

  @override
  Widget build(BuildContext context) {
    print("YukNgoding build WidgetB");
    final textColor = TextColor.of(context, textOne);

    return Column(
      children: [
        Text(
          "Widget B",
          style: TextStyle(color: textColor.colorPrimary),
        ),
        WidgetC()
      ],
    );
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("YukNgoding build WidgetC");
    final textColor = TextColor.of(context, textTwo);

    return Column(
      children: [
        Text(
          "Widget C",
          style: TextStyle(color: textColor.colorSecondary),
        ),
        WidgetD()
      ],
    );
  }
}

class WidgetD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("YukNgoding build WidgetD");
    final textColor = TextColor.of(context, textTwo);

    return Column(
      children: [
        Text(
          "Widget D",
          style: TextStyle(color: textColor.colorSecondary),
        ),
      ],
    );
  }
}
