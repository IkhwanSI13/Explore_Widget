import 'package:device_preview/device_preview.dart';
import 'package:explore_widget/key.dart';
import 'package:explore_widget/mainActivity.dart';
import 'package:explore_widget/nonWidget/linearGradient/LinearGradientActivity.dart';
import 'package:explore_widget/nonWidget/scaffoldMessenger/ScaffoldMessengerActivity.dart';
import 'package:explore_widget/page_route.dart';
import 'package:explore_widget/pubDev/flutter_rating_bar/flutterRatingBarActivity.dart';
import 'package:explore_widget/pubDev/lottie/lottieActivity.dart';
import 'package:explore_widget/pubDev/rive/riveActivity.dart';
import 'package:explore_widget/widget/animation/animatedListActivity.dart';
import 'package:explore_widget/widget/animation/animationActivity.dart';
import 'package:explore_widget/widget/autoComplete/AutoCompleteActivity.dart';
import 'package:explore_widget/widget/button/ButtonActivity.dart';
import 'package:explore_widget/widget/clipRect/CliprRectActivity.dart';
import 'package:explore_widget/widget/column/ColumnActivity.dart';
import 'package:explore_widget/widget/expanded/FlexExpandedActivity.dart';
import 'package:explore_widget/widget/expanded/FullExpandedActivity.dart';
import 'package:explore_widget/widget/fab/FabActivity.dart';
import 'package:explore_widget/widget/fab/FabBottomNavActivity.dart';
import 'package:explore_widget/widget/fab/FabOnlyActivity.dart';
import 'package:explore_widget/widget/fadeInImage/FadeInImageActivity.dart';
import 'package:explore_widget/widget/focusableActionDetector/FadButton.dart';
import 'package:explore_widget/widget/font/fontActivity.dart';
import 'package:explore_widget/widget/form/formActivity.dart';
import 'package:explore_widget/widget/hero/HeroActivity.dart';
import 'package:explore_widget/widget/inherited/InheritedActivity.dart';
import 'package:explore_widget/widget/inheritedModel/InheridetModelActivity.dart';
import 'package:explore_widget/widget/listView/listViewActivity.dart';
import 'package:explore_widget/widget/listView2/listView2Activity.dart';
import 'package:explore_widget/widget/loaders/LoadingActivity.dart';
import 'package:explore_widget/widget/navigationRail/NavigationRailActivity.dart';
import 'package:explore_widget/widget/opacity/OpacityActivity.dart';
import 'package:explore_widget/widget/pageView/PageViewActivity.dart';
import 'package:explore_widget/widget/pageView/PageViewHorizontalActivity.dart';
import 'package:explore_widget/widget/pageView/PageViewVerticalActivity.dart';
import 'package:explore_widget/widget/repaintBoundary/RepaintBoundaryActivity.dart';
import 'package:explore_widget/widget/row/RowActivity.dart';
import 'package:explore_widget/widget/safeArea/SafeAreaActivity.dart';
import 'package:explore_widget/widget/sliverAppBar/SliverAppBarActivity.dart';
import 'package:explore_widget/widget/sliverList/SliverListActivity.dart';
import 'package:explore_widget/widget/stack/StackActivity.dart';
import 'package:explore_widget/widget/statefulBuilder/StatefulBuilderActivity.dart';
import 'package:explore_widget/widget/streamBuilder/StreamBuilderActivity.dart';
import 'package:explore_widget/widget/table/TableActivity.dart';
import 'package:explore_widget/widget/tooltip/TooltipActivity.dart';
import 'package:explore_widget/widget/wrap/WrapActivity.dart';
import 'package:explore_widget/widget/wrap/WrapHorizontalActivity.dart';
import 'package:explore_widget/widget/wrap/WrapVerticalActivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  /// Uncomment this for RepaintBoundary performance
  // debugRepaintRainbowEnabled = true;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldKey,
      title: 'Widget',
      onGenerateRoute: _getRoute,
    );

    /// Run with DevicePreview package
    // return DevicePreview(
    //     enabled: true,
    //     builder: (_) => MaterialApp(
    //           useInheritedMediaQuery: true,
    //           locale: DevicePreview.locale(context),
    //           builder: DevicePreview.appBuilder,
    //           title: 'Widget',
    //           onGenerateRoute: _getRoute,
    //         ));
  }

  ///customPaint
  Route _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case linkDefault:
        return CustomPageRoute(page: MainActivity());
      case linkAnimation:
        return CustomPageRoute(page: AnimationActivity());
      case linkAutoComplete:
        return CustomPageRoute(page: AutoCompleteActivity());
      case linkColumn:
        return CustomPageRoute(page: ColumnActivity());
      case linkRow:
        return CustomPageRoute(page: RowActivity());
      case linkStack:
        return CustomPageRoute(page: StackActivity());
      case linkButton:
        return CustomPageRoute(page: ButtonActivity());
      case linkInheritedWidget:
        return CustomPageRoute(page: InheritedWidgetActivity());
      case linkInheritedModel:
        return CustomPageRoute(page: InheritedModelActivity());
      case linkClipRect:
        return CustomPageRoute(page: ClipRectActivity());
      case linkHero:
        return CustomPageRoute(page: HeroActivity());
      case linkHeroDetail:
        return CustomPageRoute(page: HeroDetailActivity());
      case linkTooltip:
        return CustomPageRoute(page: TooltipActivity());
      case linkListViewBuilder:
        return CustomPageRoute(page: ListViewActivity());
      case linkListView2Builder:
        return CustomPageRoute(page: ListView2Activity());
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
      case linkScaffoldMessenger:
        return CustomPageRoute(page: ScaffoldMessengerActivity());
      case linkSliverAppBar:
        return CustomPageRoute(page: SliverAppBarActivity());
      case linkSliverList:
        return CustomPageRoute(page: SliverListActivity());
      case linkStatefulBuilder:
        return CustomPageRoute(page: StatefulBuilderActivity());
      case linkFadeInImage:
        return CustomPageRoute(page: FadeInImageActivity());
      case linkStreamBuilder:
        return CustomPageRoute(page: StreamBuilderActivity());
      case linkFlutterRatingBar:
        return CustomPageRoute(page: FlutterRatingBarActivity());
      case linkLinearGradient:
        return CustomPageRoute(page: LinearGradientActivity());
      case linkNavigationRail:
        return CustomPageRoute(page: NavRailActivity());
      case linkFadButton:
        return CustomPageRoute(page: FadButtonActivity());
      case linkRepaintBoundary:
        return CustomPageRoute(page: RepaintBoundaryActivity());
      case linkLottie:
        return CustomPageRoute(page: LottieActivity());
      case linkRive:
        return CustomPageRoute(page: RiveActivity());
      case linkAnimatedList:
        return CustomPageRoute(page: MyAnimatedListSample());
    }
    return CustomPageRoute(page: MainActivity());
  }
}
