import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/constants/map_constants.dart';

Marker pointMap() {
  return Marker(
      width: 10.0,
      height: 10.0,
      child: const Icon(
        Icons.circle,
        size: 5.0,
        color: Colors.red,
      ),
      point: const LatLng(MapConstants.latitude, MapConstants.longitude));
}
