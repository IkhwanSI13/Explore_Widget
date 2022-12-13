import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveActivity extends StatefulWidget {
  const RiveActivity({
    Key? key,
  }) : super(key: key);

  @override
  State<RiveActivity> createState() => _RiveActivityState();
}

class _RiveActivityState extends State<RiveActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("rive"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 72),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ///
            MyTitle("RiveAnimation.asset | animations"),
            SizedBox(
              child: WolvieRive(),
            ),
            MyTitle(
                "RiveAnimation.asset | RiveAnimationController | SimpleAnimation"),
            SizedBox(
              child: WolvieRive2(),
            ),
            MyTitle("RiveAnimation.asset | SimpleAnimation"),
            SizedBox(
              child: StickManRiveOneShoot(),
            ),
            MyTitle("StateMachineController"),
            SizedBox(
              height: 281,
              child: StateMachineSkills(),
            ),
            SizedBox(
              height: 281,
              child: CarRive(),
            ),
          ],
        ),
      ),
    );
  }
}

///
class WolvieRive extends StatefulWidget {
  const WolvieRive({Key? key}) : super(key: key);

  @override
  _WolvieRiveState createState() => _WolvieRiveState();
}

class _WolvieRiveState extends State<WolvieRive> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: const RiveAnimation.asset(
            "assets/rive/wolvie.riv",
            animations: ["walk", "berserkerRage"],
          ),
        ),
      ],
    );
  }
}

///
class WolvieRive2 extends StatefulWidget {
  const WolvieRive2({Key? key}) : super(key: key);

  @override
  _WolvieRiveState2 createState() => _WolvieRiveState2();
}

class _WolvieRiveState2 extends State<WolvieRive2> {
  late RiveAnimationController _controller;
  late RiveAnimationController _controllerWalk;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('berserkerRage');
    _controllerWalk = SimpleAnimation('walk');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: RiveAnimation.asset(
            "assets/rive/wolvie.riv",
            controllers: [
              _controllerWalk,
              _controller,
            ],
          ),
        ),
        Wrap(
          runSpacing: 10.0,
          spacing: 10.0,
          children: [
            ElevatedButton(
                child: const Text('Berserker Rage'),
                onPressed: () {
                  setState(() {
                    print(
                        "Ikhwan controller Berserker before: ${_controllerWalk.isActive}");
                    _controller.isActive = !_controller.isActive;
                    print(
                        "Ikhwan controller Berserker after: ${_controllerWalk.isActive}");
                  });
                }),
            ElevatedButton(
              child: const Text('Walk'),
              onPressed: () {
                setState(() {
                  print(
                      "Ikhwan controller walk before: ${_controllerWalk.isActive}");
                  _controllerWalk.isActive = !_controllerWalk.isActive;
                  print(
                      "Ikhwan controller walk after: ${_controllerWalk.isActive}");
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

///
class StickManRiveOneShoot extends StatefulWidget {
  const StickManRiveOneShoot({Key? key}) : super(key: key);

  @override
  _StickManRiveOneShootState createState() => _StickManRiveOneShootState();
}

///
class _StickManRiveOneShootState extends State<StickManRiveOneShoot> {
  /// Controller for playback
  late RiveAnimationController _controller;
  late RiveAnimationController _controller2;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('Run');
    _controller2 = SimpleAnimation('Run_into_punch');
    // _controller = SimpleAnimation('isRunning');
    // _controller = OneShotAnimation(
    //   'crossPunch',
    //   autoplay: false,
    //   onStop: () => setState(() => _isPlaying = false),
    //   onStart: () => setState(() => _isPlaying = true),
    // );

    //          _crossPunch = controller.findInput('crossPunch');
    //           _jabPunch = controller.findInput('jabPunch');
    //           _isRunning = controller.findInput('isRunning');
    //           _sideKick = controller.findInput('sideKick');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: RiveAnimation.asset(
            "assets/rive/character.riv",
            controllers: [_controller, _controller2],
            animations: ["Idle"],
          ),
        ),
        Wrap(
          runSpacing: 10.0,
          spacing: 10.0,
          children: [
            ElevatedButton(
              child: const Text('crossPunch'),
              onPressed: () {
                // setState(() {
                //   _isPlaying ? null : _controller.isActive = true;
                // });
                setState(() {
                  print(
                      "Ikhwan controller cross punch before: ${_controller.isActive}");
                  _controller.isActive = !_controller.isActive;
                  print(
                      "Ikhwan controller cross punch after: ${_controller.isActive}");
                });
              },
            ),
            ElevatedButton(
              child: const Text('run punch'),
              onPressed: () {
                setState(() {
                  print(
                      "Ikhwan controller _controller2.isActive before: ${_controller2.isActive}");
                  _controller2.isActive = !_controller2.isActive;
                  print(
                      "Ikhwan controller _controller2.isActive after: ${_controller2.isActive}");
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

/// An example showing how to drive a StateMachine via one numeric input.
class StateMachineSkills extends StatefulWidget {
  const StateMachineSkills({Key? key}) : super(key: key);

  @override
  _StateMachineSkillsState createState() => _StateMachineSkillsState();
}

class _StateMachineSkillsState extends State<StateMachineSkills> {
  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  StateMachineController? _controller;
  SMIInput<double>? _levelInput;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/rive/skills.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, 'Designer\'s Test');
        if (controller != null) {
          artboard.addController(controller);
          _levelInput = controller.findInput('Level');
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _riveArtboard == null
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Rive(
                artboard: _riveArtboard!,
                fit: BoxFit.cover,
                useArtboardSize: true,
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    child: const Text('Beginner'),
                    onPressed: () => _levelInput?.value = 0,
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    child: const Text('Intermediate'),
                    onPressed: () => _levelInput?.value = 1,
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    child: const Text('Expert'),
                    onPressed: () => _levelInput?.value = 2,
                  ),
                ],
              ),
            ],
          );
  }
}

class CarRive extends StatefulWidget {
  const CarRive({Key? key}) : super(key: key);

  @override
  _CarRiveState createState() => _CarRiveState();
}

class _CarRiveState extends State<CarRive> {
  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  StateMachineController? _controller;

  SMIInput<bool>? _isStarted;
  SMIInput<bool>? _isPressed;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/rive/car.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(artboard, 'Car');
        if (controller != null) {
          artboard.addController(controller);
          _isStarted = controller.findInput('isStarted');
          _isPressed = controller.findInput('isPressed');
        }
        setState(() => _riveArtboard = artboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _riveArtboard == null
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Rive(
                artboard: _riveArtboard!,
                fit: BoxFit.cover,
                useArtboardSize: true,
              ),
              Wrap(
                children: [
                  ElevatedButton(
                    child: const Text('Turn On'),
                    onPressed: () => _isStarted!.value = !_isStarted!.value,
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    child: const Text('Speed Up'),
                    onPressed: () => _isPressed!.value = !_isPressed!.value,
                  ),
                ],
              ),
            ],
          );
  }
}
