import 'package:explore_widget/commons/myButton.dart';
import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

/// Source of LottieFiles: https://lottiefiles.com/
class LottieActivity extends StatefulWidget {
  const LottieActivity({
    Key? key,
  }) : super(key: key);

  @override
  State<LottieActivity> createState() => _LottieActivityState();
}

class _LottieActivityState extends State<LottieActivity>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
  );
  late final Future<LottieComposition> _composition;

  @override
  void initState() {
    super.initState();
    _composition = _loadComposition();
  }

  Future<LottieComposition> _loadComposition() async {
    var assetData = await rootBundle.load('assets/lottie/meditating-man.json');
    return await LottieComposition.fromByteData(assetData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lottie"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ///
            // possible source lottie:
            // asset, file, memory and network,
            MyTitle("Simple load"),
            Lottie.asset(
              'assets/lottie/meditating-man.json',
              height: 180,
            ),
            // Lottie.network(
            //     'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),

            ///
            MyTitle("With controller"),
            Lottie.asset('assets/lottie/thumb-up.json',
                controller: _controller, height: 180, onLoaded: (composition) {
              print("===> loaded");
              _controller.duration = composition.duration;
              // _controller
              //   ..duration = composition.duration
              //   ..forward();
            }),
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

            ///
            MyTitle("Custom loading"),
            FutureBuilder<LottieComposition>(
              future: _composition,
              builder: (context, snapshot) {
                var composition = snapshot.data;
                if (composition != null) {
                  return Lottie(
                    composition: composition,
                    height: 180,
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),

            ///
            MyTitle("Modify properties at runtime"),
            Lottie.asset(
              'assets/lottie/meditating-man.json',
              delegates: LottieDelegates(
                text: (initialText) => '**$initialText**',
                values: [
                  ValueDelegate.color(
                    const ['Shape Layer 2', 'Rectangle', 'Fill 1'],
                    value: Colors.red,
                  ),
                  // ValueDelegate.opacity(
                  //   const ['Shape Layer 1', 'Rectangle'],
                  //   callback: (frameInfo) => (frameInfo.overallProgress * 100).round(),
                  // ),
                  // ValueDelegate.position(
                  //   const ['Shape Layer 1', 'Rectangle', '**'],
                  //   relative: const Offset(100, 200),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
