import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:playground_flutter/plugins/camera_manager.dart';

class CameraScreen extends StatefulWidget {
  @override
  CameraScreenState createState() {
    return new CameraScreenState();
  }
}

class CameraScreenState extends State<CameraScreen> {
  CameraManager cameraManager = new CameraManager();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    cameraManager.close();
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
      future: cameraManager.openCamera(),
      builder: (BuildContext context, AsyncSnapshot<CameraController> event) {
        return event.connectionState == ConnectionState.done
            ? new Container(child: new CameraPreview(event.data))
            : new Container();
      },
    );
  }
}
