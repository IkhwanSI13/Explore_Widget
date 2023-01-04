import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:path_provider/path_provider.dart';

class CamerawesomeActivity extends StatefulWidget {
  const CamerawesomeActivity({
    Key? key,
  }) : super(key: key);

  @override
  State<CamerawesomeActivity> createState() => _CamerawesomeActivityState();
}

class _CamerawesomeActivityState extends State<CamerawesomeActivity> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photoAndVideo(
          photoPathBuilder: () => _path(CaptureMode.photo),
          videoPathBuilder: () => _path(CaptureMode.video),
          initialCaptureMode: CaptureMode.photo,
        ),
        flashMode: FlashMode.auto,
        aspectRatio: CameraAspectRatios.ratio_16_9,
        onMediaTap: (mediaCapture) {
          // OpenFile.open(mediaCapture.filePath);
        },
      ),
    );
  }

  Future<String> _path(CaptureMode captureMode) async {
    final Directory extDir = await getTemporaryDirectory();
    final testDir =
    await Directory('${extDir.path}/test').create(recursive: true);
    final String fileExtension =
    captureMode == CaptureMode.photo ? 'jpg' : 'mp4';
    final String filePath =
        '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
    return filePath;
  }
}