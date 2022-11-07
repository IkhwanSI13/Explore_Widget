part of "animationActivity.dart";

class MyAlignTransition extends StatefulWidget {
  @override
  State<MyAlignTransition> createState() => _AlignTransitionState();
}

class _AlignTransitionState extends State<MyAlignTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(_controller

        /// Use CurvedAnimation to get curved effect
        // CurvedAnimation(
        //   parent: _controller,
        //   curve: Curves.bounceInOut,
        // ),
        );
  }

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
          "AnimatedAlign",
          margin: EdgeInsets.only(bottom: 8),
          color: Colors.lightBlueAccent,
        ),
        Wrap(
          children: [
            SizedBox(
              width: 145,
              child: MyButton("forward", () {
                _controller.forward();
              }),
            ),
            SizedBox(
              width: 145,
              child: MyButton("reverse", () {
                _controller.reverse();
              }),
            ),
            SizedBox(
              width: 145,
              child: MyButton("stop", () {
                _controller.stop();
              }),
            ),
            SizedBox(
              width: 145,
              child: MyButton("repeat", () {
                _controller.repeat(reverse: true);
              }),
            ),
            SizedBox(
              width: 145,
              child: MyButton("reset", () {
                _controller.reset();
              }),
            ),
          ],
        ),
        Container(
          margin: contentMargin,
          child: AlignTransition(
            alignment: _alignAnimation,
            child: const Rectangle(
              color1: Colors.green,
              color2: Colors.blue,
              width: 50,
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}

///
class MyDecoratedBoxTransition extends StatefulWidget {
  @override
  State<MyDecoratedBoxTransition> createState() =>
      _MyDecoratedBoxTransitionState();
}

class _MyDecoratedBoxTransitionState extends State<MyDecoratedBoxTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);
  final DecorationTween _decorationTween = DecorationTween(
    begin: BoxDecoration(
      color: Colors.greenAccent,
      border: Border.all(style: BorderStyle.none),
      borderRadius: BorderRadius.circular(60.0),
      boxShadow: const <BoxShadow>[
        BoxShadow(
          color: Color(0x66666666),
          blurRadius: 10.0,
          spreadRadius: 3.0,
          offset: Offset(0, 6.0),
        ),
      ],
    ),
    end: BoxDecoration(
      color: Colors.redAccent,
      border: Border.all(
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.zero,
      // No shadow.
    ),
  );

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
          "DecoratedBoxTransition",
          margin: EdgeInsets.only(bottom: 8),
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: DecoratedBoxTransition(
            decoration: _decorationTween.animate(_controller),
            child: Container(
              height: 120,
              padding: const EdgeInsets.all(10),
              child: const FlutterLogo(),
            ),
          ),
        ),
      ],
    );
  }
}

///
class MyDefaultTextStyleTransition extends StatefulWidget {
  @override
  State<MyDefaultTextStyleTransition> createState() =>
      _MyDefaultTextStyleTransitionState();
}

class _MyDefaultTextStyleTransitionState
    extends State<MyDefaultTextStyleTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  )..repeat(reverse: true);
  TextStyleTween _styleTween = TextStyleTween(
    begin: const TextStyle(
        fontSize: 50, color: Colors.blue, fontWeight: FontWeight.w900),
    end: const TextStyle(
        fontSize: 50, color: Colors.red, fontWeight: FontWeight.w400),
  );

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
          "DecoratedBoxTransition",
          margin: EdgeInsets.only(bottom: 8),
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: DefaultTextStyleTransition(
            style: _styleTween.animate(_controller),
            child: const Text('Flutter'),
          ),
        ),
      ],
    );
  }
}

///
class MyFadeTransition extends StatefulWidget {
  @override
  State<MyFadeTransition> createState() => _MyFadeTransitionState();
}

class _MyFadeTransitionState extends State<MyFadeTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

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
          "DecoratedBoxTransition",
          margin: EdgeInsets.only(bottom: 8),
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: FadeTransition(
            opacity: _controller,
            child: const Padding(
                padding: EdgeInsets.all(8),
                child: FlutterLogo(
                  size: 120,
                )),
          ),
        ),
      ],
    );
  }
}

///
class MyPositionedTransition extends StatefulWidget {
  @override
  State<MyPositionedTransition> createState() => _MyPositionedTransitionState();
}

class _MyPositionedTransitionState extends State<MyPositionedTransition>
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
          "PositionedTransition",
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
                    PositionedTransition(
                      rect: RelativeRectTween(
                        begin: RelativeRect.fromSize(
                            Rect.fromLTWH(0, 0, smallLogo, smallLogo), biggest),
                        end: RelativeRect.fromSize(
                            Rect.fromLTWH(biggest.width - bigLogo,
                                biggest.height - bigLogo, bigLogo, bigLogo),
                            biggest),
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

///
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

///
class MyRotationTransition extends StatefulWidget {
  @override
  State<MyRotationTransition> createState() =>
      _MyRotationTransitionState();
}

class _MyRotationTransitionState
    extends State<MyRotationTransition>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

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
          "RotationTransition",
          margin: EdgeInsets.only(bottom: 8),
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: RotationTransition(
            turns: _controller,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FlutterLogo(size: 150.0),
            ),
          ),
        ),
      ],
    );
  }
}

///
class AlignRotateTransition extends StatefulWidget {
  const AlignRotateTransition({Key? key}) : super(key: key);

  @override
  State<AlignRotateTransition> createState() => _AlignRotateTransitionState();
}

class _AlignRotateTransitionState extends State<AlignRotateTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late final Animation<AlignmentGeometry> _alignAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

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
          "AnimatedAlign",
          margin: EdgeInsets.only(bottom: 8),
          color: Colors.lightBlueAccent,
        ),
        Container(
          margin: contentMargin,
          child: BlurContainer(
            containerHeight: 200,
            child: AlignTransition(
              alignment: _alignAnimation,
              child: RotationTransition(
                turns: _rotationAnimation,
                child: const Rectangle(
                  color1: Colors.green,
                  color2: Colors.blue,
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

///
class Rectangle extends StatelessWidget {
  const Rectangle({
    Key? key,
    this.width = 60,
    this.height = 40,
    required this.color1,
    required this.color2,
    this.top,
    this.bottom,
    this.left,
    this.right,
  }) : super(key: key);

  final double width;
  final double height;
  final Color color1;
  final Color color2;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class BlurContainer extends StatelessWidget {
  const BlurContainer({
    Key? key,
    this.containerHeight = 120,
    this.child,
  }) : super(key: key);

  final double containerHeight;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
        child: Container(
          clipBehavior: Clip.none,
          height: containerHeight,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
