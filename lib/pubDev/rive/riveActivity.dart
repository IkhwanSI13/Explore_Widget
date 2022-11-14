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
            // possible source:
            // asset, file, and network,
            // MyTitle("Simple load"),
            // SizedBox(
            //   height: 120,
            //   child: RiveAnimation.asset(
            //     'assets/rive/thanks.riv',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            MyTitle("With Controller"),
            SizedBox(
              height: 281,
              child: StateMachineSkills(),
            ),
            SizedBox(
              height: 281,
              child: CarRive(),
            ),
            SizedBox(
              height: 281,
              child: StickmanRive(),
            ),
            SizedBox(
              height: 359,
              child: WolvieRive(),
            ),
          ],
        ),
      ),
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

class StickmanRive extends StatefulWidget {
  const StickmanRive({Key? key}) : super(key: key);

  @override
  _StickmanRiveState createState() => _StickmanRiveState();
}

class _StickmanRiveState extends State<StickmanRive> {
  Artboard? _riveArtboard;
  SMIInput<bool>? _crossPunch;
  SMIInput<bool>? _jabPunch;
  SMIInput<bool>? _isRunning;
  SMIInput<bool>? _sideKick;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/rive/character.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, 'New Artboard');
        if (controller != null) {
          artboard.addController(controller);
          _crossPunch = controller.findInput('crossPunch');
          _jabPunch = controller.findInput('jabPunch');
          _isRunning = controller.findInput('isRunning');
          _sideKick = controller.findInput('sideKick');
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
                spacing: 10.0,
                children: [
                  ElevatedButton(
                    child: const Text('Cross Punch'),
                    onPressed: () => _crossPunch!.value = !_crossPunch!.value,
                  ),
                  ElevatedButton(
                    child: const Text('Jab Punch'),
                    onPressed: () => _jabPunch!.value = !_jabPunch!.value,
                  ),
                  ElevatedButton(
                    child: const Text('Run'),
                    onPressed: () => _isRunning!.value = !_isRunning!.value,
                  ),
                  ElevatedButton(
                    child: const Text('Side Kick'),
                    onPressed: () => _sideKick!.value = !_sideKick!.value,
                  ),
                ],
              ),
            ],
          );
  }
}

class WolvieRive extends StatefulWidget {
  const WolvieRive({Key? key}) : super(key: key);

  @override
  _WolvieRiveState createState() => _WolvieRiveState();
}

class _WolvieRiveState extends State<WolvieRive> {
  Artboard? _riveArtboard;
  SMIInput<bool>? _berserkerRage;
  SMIInput<bool>? _direction;
  SMIInput<bool>? _walk;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/rive/wolvie.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, 'Animate');
        if (controller != null) {
          artboard.addController(controller);
          _berserkerRage = controller.findInput('berserkerRage');
          _direction = controller.findInput('direction(defaultRight)');
          _walk = controller.findInput('walk');
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
                runSpacing: 10.0,
                spacing: 10.0,
                children: [
                  ElevatedButton(
                    child: const Text('Berserker Rage'),
                    onPressed: () =>
                        _berserkerRage!.value = !_berserkerRage!.value,
                  ),
                  ElevatedButton(
                    child: const Text('Direction'),
                    onPressed: () => _direction!.value = !_direction!.value,
                  ),
                  ElevatedButton(
                    child: const Text('Walk'),
                    onPressed: () => _walk!.value = !_walk!.value,
                  ),
                ],
              ),
            ],
          );
  }
}
