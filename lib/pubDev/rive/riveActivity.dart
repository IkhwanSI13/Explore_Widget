import 'package:explore_widget/commons/myTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

///https://rive.app/community/2323-4608-wolvie-v2/
///https://rive.app/community/3563-7455-character-controller/
///https://rive.app/community/3273-6891-car-game-demo/

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
            MyTitle("RiveAnimation.asset | SimpleAnimation & OneShotAnimation"),
            SizedBox(
              child: WolvieRive2(),
            ),
            MyTitle("RiveAnimation.asset | SimpleAnimation"),
            SizedBox(
              child: StickManRiveOneShoot(),
            ),
            MyTitle("StateMachineController"),
            MySubTitle("SMIInput<double>"),
            SizedBox(
              height: 281,
              child: StateMachineSkills(),
            ),
            MySubTitle("SMIInput<bool>"),
            SizedBox(
              height: 281,
              child: CarRive(),
            ),
            MySubTitle("SMITrigger & SMIInput<bool>"),
            SizedBox(
              height: 281,
              child: StickmanRive(),
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
            animations: ["idle", "berserkerRage"],
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
  late RiveAnimationController _controllerTurnLeft;
  late RiveAnimationController _controllerWalk;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controllerTurnLeft = OneShotAnimation(
      'turnLeft',
      autoplay: false,
      onStop: () {
        print("==>LOG onStop turnLeft");
        setState(() => _isPlaying = false);
      },
      onStart: () {
        print("==>LOG onStart turnLeft");
        setState(() => _isPlaying = true);
      },
    );
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
              _controllerTurnLeft,
            ],
          ),
        ),
        Wrap(
          runSpacing: 10.0,
          spacing: 10.0,
          children: [
            ElevatedButton(
                child: const Text('Turn Left'),
                onPressed: () {
                  // setState(() {
                    _isPlaying ? null : _controllerTurnLeft.isActive = true;
                  // });
                }),
            ElevatedButton(
              child: const Text('Walk'),
              onPressed: () {
                // setState(() {
                  _controllerWalk.isActive = !_controllerWalk.isActive;
                // });
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

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('Run');
    _controller2 = SimpleAnimation('Run_into_punch');
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
              child: const Text('Run'),
              onPressed: () {
                _controller.isActive = !_controller.isActive;
              },
            ),
            ElevatedButton(
              child: const Text('Run punch'),
              onPressed: () {
                _controller2.isActive = !_controller2.isActive;
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

  Artboard? _riveArtBoard;
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

        // The artBoard is the root of the animation and gets drawn in the
        // Rive widget.
        final artBoard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artBoard, 'Designer\'s Test');
        if (controller != null) {
          artBoard.addController(controller);
          _levelInput = controller.findInput('Level');
        }
        setState(() => _riveArtBoard = artBoard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _riveArtBoard == null
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Rive(
                artboard: _riveArtBoard!,
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

  Artboard? _riveArtBoard;
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

        // The artBoard is the root of the animation and gets drawn in the
        // Rive widget.
        final artBoard = file.mainArtboard;
        var controller = StateMachineController.fromArtboard(artBoard, 'Car');
        if (controller != null) {
          artBoard.addController(controller);
          _isStarted = controller.findInput('isStarted');
          _isPressed = controller.findInput('isPressed');
        }
        setState(() => _riveArtBoard = artBoard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _riveArtBoard == null
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Rive(
                artboard: _riveArtBoard!,
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
  Artboard? _riveArtBoard;
  SMITrigger? _crossPunch;
  SMITrigger? _jabPunch;
  SMIInput<bool>? _isRunning;
  SMITrigger? _sideKick;

  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/rive/character.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artBoard is the root of the animation and gets drawn in the
        // Rive widget.
        final artBoard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artBoard, 'State Machine 1');
        if (controller != null) {
          artBoard.addController(controller);
          _crossPunch = controller.findInput<bool>('crossPunch') as SMITrigger;
          _jabPunch = controller.findInput<bool>('jabPunch') as SMITrigger;
          _isRunning = controller.findInput<bool>('isRunning') as SMIBool;
          _sideKick = controller.findInput<bool>('sideKick') as SMITrigger;
        }
        setState(() => _riveArtBoard = artBoard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _riveArtBoard == null
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Rive(
                artboard: _riveArtBoard!,
                fit: BoxFit.cover,
                useArtboardSize: true,
              ),
              Wrap(
                spacing: 10.0,
                children: [
                  ElevatedButton(
                    child: const Text('Cross Punch'),
                    onPressed: () => _crossPunch?.fire(),
                  ),
                  ElevatedButton(
                    child: const Text('Jab Punch'),
                    onPressed: () => _jabPunch?.fire(),
                  ),
                  ElevatedButton(
                    child: const Text('Run'),
                    onPressed: () => _isRunning!.value = !_isRunning!.value,
                  ),
                  ElevatedButton(
                    child: const Text('Side Kick'),
                    onPressed: () => _sideKick?.fire(),
                  ),
                ],
              ),
            ],
          );
  }
}
