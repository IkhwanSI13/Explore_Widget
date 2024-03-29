import 'package:explore_widget/commons/myButton.dart';
import 'package:explore_widget/commons/myTitle.dart';
import 'package:explore_widget/page_route.dart';
import 'package:explore_widget/widget/animation/implicit/animated_align.dart';
import 'package:flutter/material.dart';

import 'explicit/explicit.dart';
import 'implicit/implicit.dart';

final EdgeInsets contentMargin = EdgeInsets.symmetric(
  vertical: 18,
  horizontal: 24,
);

class AnimationActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationActivityState();
}

class _AnimationActivityState extends State<AnimationActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 24.0,
          bottom: 72.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MyTitle("Implicit Animations"),
            MySubTitle(
              "Ready-to-Use Widgets",
              margin: EdgeInsets.only(
                top: 4,
                bottom: 8,
              ),
            ),
            MyAnimatedAlign(),
            MyAnimatedContainer(),
            MyAnimatedDefaultTextStyle(),
            MyAnimatedOpacity(),
            MyAnimatedPadding(),
            MyAnimatedPhysicalModel(),
            MyAnimatedPositioned(),
            MyAnimatedPositionedDirectional(),
            MyAnimatedSize(),
            MyAnimatedCrossFade(),
            MyAnimatedSwitcher(),

            MySubTitle(
              "AnimatedList",
              color: Colors.lightBlueAccent,
            ),
            MyButton("GO", () {
              Navigator.of(context).pushNamed(linkAnimatedList);
            }),

            ///
            MySubTitle(
              "TweenAnimationBuilder widgets",
              margin: EdgeInsets.only(
                top: 4,
                bottom: 8,
              ),
            ),
            MyTweenAnimationBuilder(),

            ///
            MyTitle("Explicit Animations"),
            MySubTitle(
              "Ready-to-Use Widgets",
              margin: EdgeInsets.only(
                top: 4,
                bottom: 8,
              ),
            ),
            MyAlignTransition(),
            MyDecoratedBoxTransition(),
            MyDefaultTextStyleTransition(),
            MyFadeTransition(),
            MyPositionedTransition(),
            MyRelativePositionedTransition(),
            MyRotationTransition(),
            MyScaleTransition(),
            MySizeTransition(),
            MySlideTransition(),
            AlignRotateTransition(),

            ///
            MySubTitle(
              "AnimatedBuilder widgets",
              margin: EdgeInsets.only(
                top: 4,
                bottom: 8,
              ),
            ),
            MyAnimatedBuilder(),

            ///
            MySubTitle(
              "AnimatedWidget Class",
              margin: EdgeInsets.only(
                top: 4,
                bottom: 8,
              ),
            ),
            MyAnimatedWidget(),
          ],
        ),
      ),
    );
  }
}
