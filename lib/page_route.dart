import 'package:flutter/material.dart';

const linkDefault = "/";
const linkAnimatedContainer = "/AnimatedContainer";
const linkAutoComplete = "/AutoComplete";
const linkButton = "/Button";
const linkColumn = "/Column";
const linkClipRect = "/ClipRect";
const linkExpanded = "/Expanded";
const linkExpandedFlex = "/ExpandedFlex";
const linkFab = "/Fab";
const linkFabOnly = "/FabOnly";
const linkFabBottomNav = "/FabBottomNav";
const linkFadeInImage = "/FadeInImage";
const linkFlutterRatingBar = "/FlutterRatingBar";
const linkFont = "/Font";
const linkForm = "/WidgetForm";
const linkHero = "/ClipHero";
const linkHeroDetail = "/ClipHeroDetail";
const linkInheritedWidget = "/InheritedWidget";
const linkInheritedModel = "/InheritedModel";
const linkLinearGradient = "/LinearGradient";
const linkListViewBuilder = "/WidgetListView";
const linkListView2Builder = "/WidgetListView2";
const linkLoading = "/WidgetLoading";
const linkMediaPicker = "/WidgetMediaPicker";
const linkPageView = "/PageView";
const linkPageViewVertical = "/PageViewVertical";
const linkPageViewHorizontal = "/PageViewHorizontal";
const linkRow = "/Row";
const linkSafeArea = "/SafeArea";
const linkSliverAppBar = "/SliverAppBar";
const linkSliverList = "/SliverList";
const linkStack = "/Stack";
const linkStreamBuilder = "/StreamBuilder";
const linkTable = "/Table";
const linkTooltip = "/Tooltip";
const linkOpacity = "/Opacity";
const linkWrap = "/Wrap";
const linkWrapVertical = "/WrapVertical";
const linkWrapHorizontal = "/WrapHorizontal";

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;

  CustomPageRoute({this.page})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          transitionDuration: Duration(milliseconds: 250),
        );
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;

  SlideRightRoute({this.page})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
          transitionDuration: Duration(milliseconds: 250),
        );
}
