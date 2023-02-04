import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';

import '../animation_activity.dart';

class MyRelativePositionedTransition extends StatefulWidget {
  @override
  State<MyRelativePositionedTransition> createState() =>
      _MyRelativePositionedTransitionState();
}

class _MyRelativePositionedTransitionState
    extends State<MyRelativePositionedTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  double smallLogo = 100;
  double bigLogo = 200;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MySubTitle(
          "RelativePositionedTransition",
          margin: EdgeInsets.only(bottom: 8),
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: Container(
            height: 220,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final Size biggest = constraints.biggest;
                return Stack(
                  children: <Widget>[
                    RelativePositionedTransition(
                      size: biggest,
                      rect: RectTween(
                        begin: Rect.fromLTWH(0, 0, bigLogo, bigLogo),
                        end: Rect.fromLTWH(biggest.width - smallLogo,
                            biggest.height - smallLogo, smallLogo, smallLogo),
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: Curves.elasticInOut,
                      )),
                      child: const Padding(
                          padding: EdgeInsets.all(8), child: FlutterLogo()),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
