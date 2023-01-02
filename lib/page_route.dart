import 'package:flutter/material.dart';

const linkDefault = "/";
const linkAnimation = "/Animation";
const linkAnimatedList = "/AnimatedList";
const linkAutoComplete = "/AutoComplete";
const linkButton = "/Button";
const linkCamera = "/Camera";
const linkCamerawesome = "/Camerawesome";
const linkColumn = "/Column";
const linkClipRect = "/ClipRect";
const linkExpanded = "/Expanded";
const linkExpandedFlex = "/ExpandedFlex";
const linkFab = "/Fab";
const linkFabOnly = "/FabOnly";
const linkFabBottomNav = "/FabBottomNav";
const linkFadButton = "/FadButton";
const linkFadeInImage = "/FadeInImage";
const linkFlutterRatingBar = "/FlutterRatingBar";
const linkFocusableActionDetector = "/FocusableActionDetector";
const linkFont = "/Font";
const linkForm = "/Form";
const linkHero = "/ClipHero";
const linkHeroDetail = "/ClipHeroDetail";
const linkInheritedWidget = "/InheritedWidget";
const linkInheritedModel = "/InheritedModel";
const linkLinearGradient = "/LinearGradient";
const linkListViewBuilder = "/WidgetListView";
const linkListView2Builder = "/WidgetListView2";
const linkLoading = "/WidgetLoading";
const linkLottie = "/Lottie";
const linkNavigationRail = "/NavigationRail";
const linkPageView = "/PageView";
const linkPageViewVertical = "/PageViewVertical";
const linkPageViewHorizontal = "/PageViewHorizontal";
const linkRepaintBoundary = "/RepaintBoundary";
const linkRive = "/Rive";
const linkRow = "/Row";
const linkSafeArea = "/SafeArea";
const linkScaffoldMessenger = "/ScaffoldMessenger";
const linkSliverAppBar = "/SliverAppBar";
const linkSliverList = "/SliverList";
const linkStack = "/Stack";
const linkStatefulBuilder = "/StatefulBuilder";
const linkStreamBuilder = "/StreamBuilder";
const linkTable = "/Table";
const linkTooltip = "/Tooltip";
const linkOpacity = "/Opacity";
const linkWrap = "/Wrap";
const linkWrapVertical = "/WrapVertical";
const linkWrapHorizontal = "/WrapHorizontal";

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;

  CustomPageRoute({required this.page})
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

  SlideRightRoute({required this.page})
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
