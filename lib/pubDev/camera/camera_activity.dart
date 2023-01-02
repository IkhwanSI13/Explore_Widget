import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraActivity extends StatefulWidget {
  const CameraActivity({
    Key? key,
  }) : super(key: key);

  @override
  State<CameraActivity> createState() => _CameraActivityState();
}

class _CameraActivityState extends State<CameraActivity>
    with WidgetsBindingObserver {
  CameraController? controller;
  String imagePath = '';

  List<CameraDescription> cameras = [];
  int cameraActive = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  @override
  Widget build(BuildContext context) => SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          body: cameras.isEmpty
              ? FutureBuilder<void>(
                  future: loadCamera(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return cameras.isEmpty ? emptyNoCamera() : cameraWidget();
                    }
                    return Text("Loading ...");
                  })
              : cameraWidget()));

  Widget emptyNoCamera() => Container(
      margin: const EdgeInsets.fromLTRB(24, 12, 24, 12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 26,
          height: 26,
          color: Colors.white,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
                "Tidak ada camera yang tersedia pada device yang anda gunakan",
                textAlign: TextAlign.center),
          ),
        )
      ]));

  Widget cameraWidget() => Container(
      color: Colors.black,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Stack(children: [
              Positioned.fill(child: CameraPreview(controller!)),
              Container(
                width: 36,
                height: 36,
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                margin: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 26,
                  ),
                ),
              )
            ])),
            Container(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    child: InkWell(
                      child: const CircleAvatar(
                          radius: 32, backgroundColor: Colors.grey),
                      onTap: () {
                        onTakePictureClicked();
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            )
          ]));

  ///LIFECYCLE
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
    // App state changed before we got the chance to initialize.
    if (controller == null || !controller!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      controller?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (controller != null) {
        onNewCameraSelected(controller!.description);
      }
    }
  }

  ///CAMERA
  Future<void> loadCamera() async {
    cameras = await availableCameras();
    await onNewCameraSelected(cameras.first);
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller!.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.medium,
        enableAudio: false);

    // If the controller is updated then update the UI.
    controller!.addListener(() {
      if (mounted) setState(() {});
      if (controller!.value.hasError) {
        print(
            '==> ExploreWidget Error: Camera error ${controller!.value.errorDescription}');
      }
    });

    try {
      await controller!.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  onTakePictureClicked() {
    takePicture().then((String? filePath) {
      if (mounted) {
        imagePath = filePath ?? "";
        print('==> ExploreWidget imagePath: $imagePath');
      }
    });
  }

  Future<String?> takePicture() async {
    if (!controller!.value.isInitialized) {
      print('==> ExploreWidget Error: select a camera first.');
      return null;
    }
    // final Directory extDir = await getApplicationDocumentsDirectory();
    // final String dirPath = '${extDir.path}/Pictures';
    // await Directory(dirPath).create(recursive: true);
    // final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      var result = await controller!.takePicture();
      return result.path;
    } on CameraException catch (e) {
      _showCameraException(e);
      return null;
    }
  }

  void _showCameraException(CameraException e) {
    print('==> ExploreWidget Error: ${e.code}\n${e.description}');
  }
}
