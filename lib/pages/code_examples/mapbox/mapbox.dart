import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapBoxDemo extends StatefulWidget {
  const MapBoxDemo({Key key}) : super(key: key);

  @override
  _MapBoxDemoState createState() => _MapBoxDemoState();
}

class _MapBoxDemoState extends State<MapBoxDemo> {
  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(-34.89052276039318, -56.18051875904071),
    zoom: 11.0,
  );

  MapboxMapController mapController;
  CameraPosition _position = _kInitialPosition;
  CameraTargetBounds _cameraTargetBounds = CameraTargetBounds.unbounded;
  MinMaxZoomPreference _minMaxZoomPreference = MinMaxZoomPreference.unbounded;
  String _styleString = MapboxStyles.MAPBOX_STREETS;

  MyLocationTrackingMode _myLocationTrackingMode =
      MyLocationTrackingMode.Tracking;

  @override
  void initState() {
    super.initState();
  }

  void _onMapChanged() {
    setState(() {
      _extractMapInfo();
    });
  }

  void _extractMapInfo() {
    _position = mapController.cameraPosition;
  }

  @override
  void dispose() {
    mapController.removeListener(_onMapChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MapboxMap mapboxMap = MapboxMap(
        onMapCreated: onMapCreated,
        initialCameraPosition: _kInitialPosition,
        trackCameraPosition: true,
        compassEnabled: true,
        cameraTargetBounds: _cameraTargetBounds,
        minMaxZoomPreference: _minMaxZoomPreference,
        styleString: _styleString,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        zoomGesturesEnabled: true,
        myLocationEnabled: true,
        myLocationTrackingMode: _myLocationTrackingMode,
        onMapClick: (point, latLng) async {
          print(
              "${point.x},${point.y}   ${latLng.latitude}/${latLng.longitude}");
          List features =
              await mapController.queryRenderedFeatures(point, [], null);
          if (features.length > 0) {
            print(features[0]);
          }
        },
        onCameraTrackingDismissed: () {
          this.setState(() {
            _myLocationTrackingMode = MyLocationTrackingMode.None;
          });
        });

    return Scaffold(
      appBar: AppBar(
        title: Text('MapBox'),
      ),
      body: mapboxMap,
    );
  }

  void onMapCreated(MapboxMapController controller) {
    mapController = controller;
    mapController.addListener(_onMapChanged);
    _extractMapInfo();
    setState(() {});
  }
}
