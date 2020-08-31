import 'package:explore_widget/mainActivity.dart';
import 'package:explore_widget/page_route.dart';
import 'package:explore_widget/widget/animatedContainer/AnimatedActivity.dart';
import 'package:explore_widget/widget/column/ColumnActivity.dart';
import 'package:explore_widget/widget/expanded/FlexExpandedActivity.dart';
import 'package:explore_widget/widget/expanded/FullExpandedActivity.dart';
import 'package:explore_widget/widget/fab/FabActivity.dart';
import 'package:explore_widget/widget/fab/FabBottomNavActivity.dart';
import 'package:explore_widget/widget/fab/FabOnlyActivity.dart';
import 'package:explore_widget/widget/fadeInImage/FadeInImageActivity.dart';
import 'package:explore_widget/widget/font/fontActivity.dart';
import 'package:explore_widget/widget/form/formActivity.dart';
import 'package:explore_widget/widget/listView/listViewActivity.dart';
import 'package:explore_widget/widget/listView2/listView2Activity.dart';
import 'package:explore_widget/widget/loaders/LoadingActivity.dart';
import 'package:explore_widget/widget/mediaPicker/mediaPickerActivity.dart';
import 'package:explore_widget/widget/opacity/OpacityActivity.dart';
import 'package:explore_widget/widget/pageView/PageViewActivity.dart';
import 'package:explore_widget/widget/pageView/PageViewHorizontalActivity.dart';
import 'package:explore_widget/widget/pageView/PageViewVerticalActivity.dart';
import 'package:explore_widget/widget/row/RowActivity.dart';
import 'package:explore_widget/widget/safeArea/SafeAreaActivity.dart';
import 'package:explore_widget/widget/sliverAppBar/SliverAppBarActivity.dart';
import 'package:explore_widget/widget/sliverList/SliverListActivity.dart';
import 'package:explore_widget/widget/stack/StackActivity.dart';
import 'package:explore_widget/widget/streamBuilder/StreamBuilderActivity.dart';
import 'package:explore_widget/widget/table/TableActivity.dart';
import 'package:explore_widget/widget/wrap/WrapActivity.dart';
import 'package:explore_widget/widget/wrap/WrapHorizontalActivity.dart';
import 'package:explore_widget/widget/wrap/WrapVerticalActivity.dart';
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
      case linkColumn:
        return CustomPageRoute(page: ColumnActivity());
      case linkRow:
        return CustomPageRoute(page: RowActivity());
      case linkStack:
        return CustomPageRoute(page: StackActivity());
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
      case linkWrap:
        return CustomPageRoute(page: WrapActivity());
      case linkWrapVertical:
        return CustomPageRoute(page: WrapVerticalActivity());
      case linkWrapHorizontal:
        return CustomPageRoute(page: WrapHorizontalActivity());
      case linkAnimatedContainer:
        return CustomPageRoute(page: AnimatedActivity());
      case linkOpacity:
        return CustomPageRoute(page: OpacityActivity());
      case linkFab:
        return CustomPageRoute(page: FabActivity());
      case linkFabOnly:
        return CustomPageRoute(page: FabOnlyActivity());
      case linkFabBottomNav:
        return CustomPageRoute(page: FabBottomNavActivity());
      case linkTable:
        return CustomPageRoute(page: TableActivity());
      case linkSliverAppBar:
        return CustomPageRoute(page: SliverAppBarActivity());
      case linkSliverList:
        return CustomPageRoute(page: SliverListActivity());
      case linkFadeInImage:
        return CustomPageRoute(page: FadeInImageActivity());
      case linkStreamBuilder:
        return CustomPageRoute(page: StreamBuilderActivity());

//      case linkTopicList:
//        return CustomPageRoute(page: TopicLaporanActivity(arguments[param1]));
    }
  }
}
