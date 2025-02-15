import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/constants/map_constants.dart';

PolylineLayer polygonMap() {
  final LatLng center = LatLng(MapConstants.latitude, MapConstants.longitude);
  final double radius = MapConstants.maxRadius;

  return PolylineLayer(
    polylines: generateSectorLines(center, radius),
  );
}

List<Polygon> generateSectors(LatLng center, double radius) {
  const int sectors = 8;
  List<Polygon> polygons = [];
  final Distance distance = const Distance();

  for (int i = 0; i < sectors; i++) {
    double startAngle = i * (360 / sectors);
    double endAngle = (i + 1) * (360 / sectors);

    List<LatLng> sectorPoints = [center];

    // Calculate the two boundary points for the sector
    LatLng point1 = distance.offset(center, radius, startAngle);
    LatLng point2 = distance.offset(center, radius, endAngle);

    sectorPoints.add(point1);
    sectorPoints.add(point2);
    sectorPoints.add(center); // Close the sector

    polygons.add(
      Polygon(
        points: sectorPoints,
        color: Colors.transparent, // Transparent background
        borderColor: Colors.yellow, // Yellow border
        borderStrokeWidth: 3,
      ),
    );
  }

  return polygons;
}

List<Polyline> generateSectorLines(LatLng center, double radius) {
  const int sectors = 8;
  List<Polyline> polylines = [];
  final Distance distance = const Distance();

  for (int i = 0; i < sectors; i++) {
    double angle = i * (360 / sectors);

    // Compute the outer point for the sector line
    LatLng endPoint = distance.offset(center, radius, angle);

    polylines.add(
      Polyline(
        points: [center, endPoint], // Line from center to edge
        color: Colors.yellow, // Yellow border
        strokeWidth: 3,
      ),
    );
  }

  return polylines;
}
