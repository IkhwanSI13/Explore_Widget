import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:media_picker/media_picker.dart';

class MediaPickerActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MediaPickerState();
  }
}

class MediaPickerState extends State<MediaPickerActivity> {
  String _platformVersion = 'Unknown';
  List<dynamic> _mediaPaths;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "Media Picker",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            button("Pick Image", () {
              pickImages();
            }),
            button("Pick Video", () {
              pickVideos();
            })
          ],
        ),
      ),
    );
  }

  Widget button(String text, Function onClick) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Color(0xfff6f7eb),
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Color(0xff323031))),
            padding: EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 18.0),
            child: Text(text),
          ),
        ),
      ),
    );
  }

  pickImages() async {
    try {
      _mediaPaths = await MediaPicker.pickImages(withVideo: true);

//      filter only images from mediaPaths and send them to the compressor
//      List<dynamic> listCompressed = await MediasPicker.compressImages(imgPaths: [firstPath], maxWidth: 600, maxHeight: 600, quality: 100);
//      print(listCompressed);

    } on PlatformException {}

    if (!mounted) return;

    setState(() {
      _platformVersion = _mediaPaths.toString();
    });
  }

  pickVideos() async {
    try {
      _mediaPaths = await MediaPicker.pickVideos(quantity: 7);
    } on PlatformException {}

    if (!mounted) return;

    setState(() {
      _platformVersion = _mediaPaths.toString();
    });
  }
}
