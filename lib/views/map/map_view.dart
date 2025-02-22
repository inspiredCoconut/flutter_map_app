import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../core/constants/map_constants.dart';

import '../widgets/common/map_widget.dart';
import '../widgets/common/point_map_widget.dart';
import '../widgets/common/circles_map_widget.dart';
import '../widgets/common/polygon_map_widget.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(MapConstants.latitude, MapConstants.longitude),
          initialZoom: 13.0,
        ),
        children: [
          mapLayer(),
          circlesMap(),
          polygonMap(),
          MarkerLayer(markers: [
            pointMap(),
          ]),
        ],
      ),
    );
  }
}
