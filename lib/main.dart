import 'package:explore_widget/mainActivity.dart';
import 'package:explore_widget/page_route.dart';
import 'package:explore_widget/widget/expanded/FlexExpandedActivity.dart';
import 'package:explore_widget/widget/expanded/FullExpandedActivity.dart';
import 'package:explore_widget/widget/font/fontActivity.dart';
import 'package:explore_widget/widget/form/formActivity.dart';
import 'package:explore_widget/widget/listView/listViewActivity.dart';
import 'package:explore_widget/widget/listView2/listView2Activity.dart';
import 'package:explore_widget/widget/loaders/LoadingActivity.dart';
import 'package:explore_widget/widget/mediaPicker/mediaPickerActivity.dart';
import 'package:explore_widget/widget/pageView/PageViewActivity.dart';
import 'package:explore_widget/widget/pageView/PageViewHorizontalActivity.dart';
import 'package:explore_widget/widget/pageView/PageViewVerticalActivity.dart';
import 'package:explore_widget/widget/safeArea/SafeAreaActivity.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget',
//      theme: _theme(),
      onGenerateRoute: _getRoute,
    );
  }

//  ThemeData _theme() {
//    return ThemeData(
//      appBarTheme:
//      AppBarTheme(textTheme: TextTheme(title: TextStyle14_Grey2_Lato)),
//      textTheme: TextTheme(
//          title: TextStyle14_Grey2_Lato, body1: TextStyle14_Grey2_Lato),
//    );
//  }

  Route _getRoute(RouteSettings settings) {
    final Map<String, dynamic> arguments = settings.arguments;
    switch (settings.name) {
      case linkDefault:
        return CustomPageRoute(page: MainActivity());
      case linkListViewBuilder:
        return CustomPageRoute(page: ListViewActivity());
      case linkListView2Builder:
        return CustomPageRoute(page: ListView2Activity());
      case linkMediaPicker:
        return CustomPageRoute(page: MediaPickerActivity());
      case linkForm:
        return CustomPageRoute(page: FormActivity());
      case linkLoading:
        return CustomPageRoute(page: LoadingActivity());
      case linkFont:
        return CustomPageRoute(page: FontActivity());
      case linkPageView:
        return CustomPageRoute(page: PageViewActivity());
      case linkPageViewVertical:
        return CustomPageRoute(page: PageViewVerticalActivity());
      case linkPageViewHorizontal:
        return CustomPageRoute(page: PageViewHorizontalActivity());
      case linkSafeArea:
        return CustomPageRoute(page: SafeAreaActivity());
      case linkExpanded:
        return CustomPageRoute(page: FullExpandedActivity());
      case linkExpandedFlex:
        return CustomPageRoute(page: FlexExpandedActivity());

//      case linkTopicList:
//        return CustomPageRoute(page: TopicLaporanActivity(arguments[param1]));
    }
  }
}
