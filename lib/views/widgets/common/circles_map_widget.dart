import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/constants/map_constants.dart';

CircleLayer circlesMap() {
  return CircleLayer(
    circles: [
      _circleMarker(MapConstants.minRadius, Colors.yellow),
      _circleMarker(MapConstants.midRadius, Colors.yellow),
      _circleMarker(MapConstants.maxRadius, Colors.yellow),
    ],
  );
}

CircleMarker _circleMarker(double radius, Color color) {
  return CircleMarker(
    point: LatLng(MapConstants.latitude, MapConstants.longitude),
    color: Colors.transparent,
    borderColor: color,
    borderStrokeWidth: 2,
    radius: radius,
    useRadiusInMeter: true,
  );
}