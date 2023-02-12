import 'package:flutter/material.dart';

class WidgetBindingSample extends StatefulWidget {
  final Widget child;

  const WidgetBindingSample({required this.child, super.key});

  @override
  State<WidgetBindingSample> createState() => _WidgetBindingSampleState();
}

/// Add mixin to state class ( WidgetsBindingObserver )
class _WidgetBindingSampleState extends State<WidgetBindingSample>
    with WidgetsBindingObserver {
  bool isResumed = true;
  var textState = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        setState(() {
          print("===> AppLifecycleState.resumed");
          isResumed = true;
        });
        break;
      case AppLifecycleState.inactive:
        setState(() {
          print("===> AppLifecycleState.inactive");
          isResumed = false;
        });
        break;
      case AppLifecycleState.paused:
        setState(() {
          print("===> AppLifecycleState.paused");
          isResumed = false;
        });
        break;
      case AppLifecycleState.detached:
        setState(() {
          print("===> AppLifecycleState.detached");
          isResumed = false;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WidgetsBindingObserver Example'),
      ),
      body: isResumed
          ? widget.child
          : Stack(
              children: [
                Positioned.fill(
                  child: ColoredBox(color: Colors.red),
                ),
              ],
            ),
    );
  }
}

///
class WidgetBindingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetBindingSample(
      child: Center(
        child: Text("Sample"),
      ),
    );

    /// From MaterialApp
    // return MaterialApp(
    //   builder: (_, child) => WidgetBindingSample(child: child),
    //   home: Container(),
    // );
  }
}
