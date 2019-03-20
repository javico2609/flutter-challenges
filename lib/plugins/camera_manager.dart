import 'package:camera/camera.dart';
import 'dart:async';

class CameraManager {
  CameraManager();
  CameraController _cameraCtrl;

  Future<CameraController> openCamera() async {
    CameraDescription cameraDescription;
    List<CameraDescription> cameras = await availableCameras();

    if (_cameraCtrl != null) {
      return _cameraCtrl;
    }

    for (CameraDescription xx in cameras) {
      if (xx.lensDirection == CameraLensDirection.back) {
        cameraDescription = xx;
        break;
      }
    }

    if (cameraDescription == null) {
      return null;
    }

    _cameraCtrl =
        new CameraController(cameraDescription, ResolutionPreset.medium);

    try {
      await _cameraCtrl.initialize();
    } on CameraException catch (e) {
      print(e);
    }

    return _cameraCtrl;
  }

  close() async {
    if (_cameraCtrl != null) {
      await _cameraCtrl.dispose();
    }
    _cameraCtrl = null;
  }
}
