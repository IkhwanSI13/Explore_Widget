import 'package:flutter/material.dart';

const linkDefault = "/";
const linkColumn = "/Column";
const linkRow = "/Row";
const linkStack = "/Stack";
const linkInheritedWidget = "/InheritedWidget";
const linkInheritedModel = "/InheritedModel";
const linkClipRect = "/ClipRect";
const linkListViewBuilder = "/WidgetListView";
const linkListView2Builder = "/WidgetListView2";
const linkMediaPicker = "/WidgetMediaPicker";
const linkForm = "/WidgetForm";
const linkLoading = "/WidgetLoading";
const linkFont = "/Font";
const linkPageView = "/PageView";
const linkPageViewVertical = "/PageViewVertical";
const linkPageViewHorizontal = "/PageViewHorizontal";
const linkSafeArea = "/SafeArea";
const linkExpanded = "/Expanded";
const linkExpandedFlex = "/ExpandedFlex";
const linkWrap = "/Wrap";
const linkWrapVertical = "/WrapVertical";
const linkWrapHorizontal = "/WrapHorizontal";
const linkAnimatedContainer = "/AnimatedContainer";
const linkOpacity = "/Opacity";
const linkFab = "/Fab";
const linkFabOnly = "/FabOnly";
const linkFabBottomNav = "/FabBottomNav";
const linkTable = "/Table";
const linkSliverAppBar = "/SliverAppBar";
const linkSliverList = "/SliverList";
const linkFadeInImage = "/FadeInImage";
const linkStreamBuilder = "/StreamBuilder";

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
