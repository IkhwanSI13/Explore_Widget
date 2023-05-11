import 'package:explore_widget/commons/myButton.dart';
import 'package:explore_widget/page_route.dart';
import 'package:flutter/material.dart';

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              myTitle("DevTools"),
              ..._getDevToolsWidget(context),
              myTitle("Flutter Sdk Widget"),
              ..._getFlutterSdkWidget(context),
              myTitle("Flutter Sdk non Widget"),
              ..._getFlutterSdkNonWidget(context),
              myTitle("pub.dev"),
              ..._getPubDevWidget(context),
            ],
          ),
        ),
      );

  List<Widget> _getDevToolsWidget(BuildContext context) => [
    MyButton("Flutter Inspector", () {
      Navigator.of(context).pushNamed(linkDevToolsFlutterInspector);
    }),
    MyButton("Logging View", () {
      Navigator.of(context).pushNamed(linkDevToolsLogging);
    }),
    MyButton("Memory View", () {
      Navigator.of(context).pushNamed(linkDevToolsMemory);
    }),
    MyButton("Network View", () {
      Navigator.of(context).pushNamed(linkDevToolsNetwork);
    }),
  ];

  List<Widget> _getFlutterSdkWidget(BuildContext context) => [
        MyButton("Column", () {
          Navigator.of(context).pushNamed(linkColumn);
        }),
        MyButton("Row", () {
          Navigator.of(context).pushNamed(linkRow);
        }),
        MyButton("Stack", () {
          Navigator.of(context).pushNamed(linkStack);
        }),
        MyButton("Wrap", () {
          Navigator.of(context).pushNamed(linkWrap);
        }),
        MyButton("Expanded", () {
          Navigator.of(context).pushNamed(linkExpanded);
        }),
        MyButton("Expanded with Flex", () {
          Navigator.of(context).pushNamed(linkExpandedFlex);
        }),
        MyButton("InheritedWidget", () {
          Navigator.of(context).pushNamed(linkInheritedWidget);
        }),
        MyButton("InheritedModel", () {
          Navigator.of(context).pushNamed(linkInheritedModel);
        }),

        ///
        MyButton("Animation", () {
          Navigator.of(context).pushNamed(linkAnimation);
        }),
        MyButton("AutoComplete", () {
          Navigator.of(context).pushNamed(linkAutoComplete);
        }),
        MyButton("Button", () {
          Navigator.of(context).pushNamed(linkButton);
        }),
        MyButton("ClipRect", () {
          Navigator.of(context).pushNamed(linkClipRect);
        }),
        MyButton("Fab & Bottom Nav", () {
          Navigator.of(context).pushNamed(linkFab);
        }),
        MyButton("Fade In Image", () {
          Navigator.of(context).pushNamed(linkFadeInImage);
        }),
        MyButton("FocusableActionDetector", () {
          Navigator.of(context).pushNamed(linkFadButton);
        }),
        MyButton("Font", () {
          Navigator.of(context).pushNamed(linkFont);
        }),
        MyButton("Form", () {
          Navigator.of(context).pushNamed(linkForm);
        }),
        MyButton("Hero", () {
          Navigator.of(context).pushNamed(linkHero);
        }),
        MyButton("Navigation Rail", () {
          Navigator.of(context).pushNamed(linkNavigationRail);
        }),
        MyButton("List view with in side click", () {
          Navigator.of(context).pushNamed(linkListViewBuilder);
        }),
        MyButton("List view with out side click", () {
          Navigator.of(context).pushNamed(linkListView2Builder);
        }),
        MyButton("Opacity", () {
          Navigator.of(context).pushNamed(linkOpacity);
        }),
        MyButton("PageView", () {
          Navigator.of(context).pushNamed(linkPageView);
        }),
        MyButton("Safe Area", () {
          Navigator.of(context).pushNamed(linkSafeArea);
        }),
        MyButton("Sliver App Bar", () {
          Navigator.of(context).pushNamed(linkSliverAppBar);
        }),
        MyButton("Sliver List", () {
          Navigator.of(context).pushNamed(linkSliverList);
        }),
        MyButton("StatefulBuilder", () {
          Navigator.of(context).pushNamed(linkStatefulBuilder);
        }),
        MyButton("StreamBuilder", () {
          Navigator.of(context).pushNamed(linkStreamBuilder);
        }),
        MyButton("Table", () {
          Navigator.of(context).pushNamed(linkTable);
        }),
        MyButton("Tooltip", () {
          Navigator.of(context).pushNamed(linkTooltip);
        }),

        ///
        MyButton("Repaint Boundary", () {
          Navigator.of(context).pushNamed(linkRepaintBoundary);
        }),
        MyButton("Loading", () {
          Navigator.of(context).pushNamed(linkLoading);
        }),
      ];

  List<Widget> _getFlutterSdkNonWidget(BuildContext context) => [
        MyButton("LinearGradient", () {
          Navigator.of(context).pushNamed(linkLinearGradient);
        }),
        MyButton("ScaffoldMessenger", () {
          Navigator.of(context).pushNamed(linkScaffoldMessenger);
        }),
        MyButton("WidgetBindingObserver", () {
          Navigator.of(context).pushNamed(linkWidgetBindingObserver);
        }),
      ];

  List<Widget> _getPubDevWidget(BuildContext context) => [
        MyButton("flutter_rating_bar", () {
          Navigator.of(context).pushNamed(linkFlutterRatingBar);
        }),
        MyButton("lottie", () {
          Navigator.of(context).pushNamed(linkLottie);
        }),
        MyButton("rive", () {
          Navigator.of(context).pushNamed(linkRive);
        }),
        MyButton("camera", () {
          Navigator.of(context).pushNamed(linkCamera);
        }),
        MyButton("camerawesome", () {
          Navigator.of(context).pushNamed(linkCamerawesome);
        }),
        MyButton("flutter_layout_grid", () {
          Navigator.of(context).pushNamed(linkFlutterLayoutGrid);
        }),
        MyButton("super_editor", () {
          Navigator.of(context).pushNamed(linkSuperEditor);
        }),
      ];

  ///
  Widget myTitle(String text) {
    return Container(
      margin: EdgeInsets.fromLTRB(24, 12, 24, 12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
