import 'package:flutter_map/flutter_map.dart';

import '../../../core/constants/endpoints.dart';

TileLayer mapLayer() {
  return TileLayer(
    urlTemplate: Endpoints.openStreetMap,
    subdomains: ['a', 'b', 'c'],
    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
  );
}
