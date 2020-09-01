import 'package:flutter/material.dart';

String textOne = "Text1";
String textTwo = "Text2";

class TextColor extends InheritedModel<String> {
  const TextColor({
    @required this.colorPrimary,
    @required this.colorSecondary,
    @required Widget child,
  })  : assert(colorPrimary != null),
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
  var colorsSecondary = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inherited Model"),
      ),
      body: TextColor(
          colorPrimary: Colors.red,
          colorSecondary: colorsSecondary,
          child: const ConstWidget()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            colorsSecondary = Colors.green;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class ConstWidget extends StatelessWidget {
  const ConstWidget();

  @override
  Widget build(BuildContext context) {
    print("Ikhwan build ConstWidget");

    return Column(
      children: [
        ChildOneActivity(),
        ChildTwoActivity(),
      ],
    );
  }
}

///STATELESS One
class ChildOneActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Ikhwan build ChildOneActivity");
    final textColor = TextColor.of(context, textOne);

    return Column(
      children: [
        Text(
          "Child One",
          style: TextStyle(color: textColor.colorPrimary),
        ),
      ],
    );
  }
}

///STATELESS One
class ChildTwoActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Ikhwan build ChildTwoActivity");
    final textColor = TextColor.of(context, textTwo);

    return Column(
      children: [
        Text(
          "Child Two",
          style: TextStyle(color: textColor.colorSecondary),
        ),
      ],
    );
  }
}
