import 'package:explore_widget/page_route.dart';
import 'package:flutter/material.dart';

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            "Explore Widget",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              button("List view with in side click", () {
                Navigator.of(context).pushNamed(linkListViewBuilder);
              }),
              button("List view with out side click", () {
                Navigator.of(context).pushNamed(linkListView2Builder);
              }),
              //todo-not work
              button("On Progress | MediaPicker", () {
                Navigator.of(context).pushNamed(linkMediaPicker);
              }),
              button("On Progress | Copy-paste | Form", () {
                Navigator.of(context).pushNamed(linkForm);
              }),
              button("On Progress | Copy-paste | Loading", () {
                Navigator.of(context).pushNamed(linkLoading);
              }),
              button("Font", () {
                Navigator.of(context).pushNamed(linkFont);
              }),
              button("PageView", () {
                Navigator.of(context).pushNamed(linkPageView);
              }),
              button("Safe Area", () {
                Navigator.of(context).pushNamed(linkSafeArea);
              }),
              button("Expanded", () {
                Navigator.of(context).pushNamed(linkExpanded);
              }),
              button("Expanded with Flex", () {
                Navigator.of(context).pushNamed(linkExpandedFlex);
              }),
              button("Wrap", () {
                Navigator.of(context).pushNamed(linkWrap);
              }),
              button("Animated Container", () {
                Navigator.of(context).pushNamed(linkAnimatedContainer);
              })
            ],
          ),
        ),
      );
}

Widget button(String text, Function onClick) {
  return Container(
    margin: EdgeInsets.only(left: 24, right: 24, top: 24),
    child: Material(
      borderRadius: BorderRadius.circular(8.0),
      color: Color(0xfff6f7eb),
      child: InkWell(
        onTap: () {
          onClick();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Color(0xff323031))),
          padding: EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 18.0),
          child: Text(text),
        ),
      ),
    ),
  );
}
