import 'package:device_preview/device_preview.dart';
import 'package:explore_widget/key.dart';
import 'package:explore_widget/mainActivity.dart';
import 'package:explore_widget/non_widget/linear_gradient/linear_gradient_activity.dart';
import 'package:explore_widget/non_widget/scaffold_messenger/scaffold_messenger_activity.dart';
import 'package:explore_widget/page_route.dart';
import 'package:explore_widget/pub_dev/camera/camera2_activity.dart';
import 'package:explore_widget/pub_dev/camera/camera_activity.dart';
import 'package:explore_widget/pub_dev/camerawesome/camerawesome_activity.dart';
import 'package:explore_widget/pub_dev/flutter_layout_grid/layout_grid1_activity.dart';
import 'package:explore_widget/pub_dev/flutter_layout_grid/layout_grid2_activity.dart';
import 'package:explore_widget/pub_dev/flutter_layout_grid/layout_grid3_activity.dart';
import 'package:explore_widget/pub_dev/flutter_rating_bar/flutter_rating_bar_activity.dart';
import 'package:explore_widget/pub_dev/lottie/lottie_activity.dart';
import 'package:explore_widget/pub_dev/rive/rive_activity.dart';
import 'package:explore_widget/widget/animation/animatedListActivity.dart';
import 'package:explore_widget/widget/animation/animationActivity.dart';
import 'package:explore_widget/widget/auto_complete/auto_complete_activity.dart';
import 'package:explore_widget/widget/button/button_activity.dart';
import 'package:explore_widget/widget/clip_rect/clip_rect_activity.dart';
import 'package:explore_widget/widget/column/column_activity.dart';
import 'package:explore_widget/widget/expanded/flex_expanded_activity.dart';
import 'package:explore_widget/widget/expanded/full_expanded_activity.dart';
import 'package:explore_widget/widget/fab/fab_activity.dart';
import 'package:explore_widget/widget/fab/fab_bottom_nav_activity.dart';
import 'package:explore_widget/widget/fab/fab_only_activity.dart';
import 'package:explore_widget/widget/fade_in_image/fade_in_image_activity.dart';
import 'package:explore_widget/widget/focusable_action_detector/fad_button.dart';
import 'package:explore_widget/widget/font/font_activity.dart';
import 'package:explore_widget/widget/form/form_activity.dart';
import 'package:explore_widget/widget/hero/hero_activity.dart';
import 'package:explore_widget/widget/inherited/Inherited_activity.dart';
import 'package:explore_widget/widget/inherited_model/Inheridet_model_activity.dart';
import 'package:explore_widget/widget/list_view/list_view_activity.dart';
import 'package:explore_widget/widget/list_view2/list_view2_activity.dart';
import 'package:explore_widget/widget/loaders/loading_activity.dart';
import 'package:explore_widget/widget/navigation_rail/navigation_rail_activity.dart';
import 'package:explore_widget/widget/opacity/opacity_activity.dart';
import 'package:explore_widget/widget/page_view/page_view_activity.dart';
import 'package:explore_widget/widget/page_view/page_view_horizontal_activity.dart';
import 'package:explore_widget/widget/page_view/page_view_vertical_activity.dart';
import 'package:explore_widget/widget/repaint_boundary/repaint_boundary_activity.dart';
import 'package:explore_widget/widget/row/row_activity.dart';
import 'package:explore_widget/widget/safe_area/safe_area_activity.dart';
import 'package:explore_widget/widget/sliver_app_bar/sliver_app_bar_activity.dart';
import 'package:explore_widget/widget/sliver_list/sliver_list_activity.dart';
import 'package:explore_widget/widget/stack/stack_activity.dart';
import 'package:explore_widget/widget/stateful_builder/stateful_builder_activity.dart';
import 'package:explore_widget/widget/stream_builder/stream_builder_activity.dart';
import 'package:explore_widget/widget/table/table_activity.dart';
import 'package:explore_widget/widget/tooltip/tooltip_activity.dart';
import 'package:explore_widget/widget/wrap/wrap_activity.dart';
import 'package:explore_widget/widget/wrap/wrap_horizontal_activity.dart';
import 'package:explore_widget/widget/wrap/wrap_vertical_activity.dart';
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
      case linkCamera:
        return CustomPageRoute(page: CameraExampleHome());
      // return CustomPageRoute(page: CameraActivity());
      case linkCamerawesome:
        return CustomPageRoute(page: CamerawesomeActivity());
      case linkFlutterLayoutGrid:
        // return CustomPageRoute(page: LayoutGrid1Activity());
        // return CustomPageRoute(page: LayoutGrid2Activity());
        return CustomPageRoute(page: LayoutGrid3Activity());
    }
    return CustomPageRoute(page: MainActivity());
  }
}
