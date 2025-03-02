import 'package:dio/dio.dart';
import 'package:flutter_map_app/core/constants/endpoints.dart';

class ApiHelper {
  final Dio dioHelper = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl, // Base API URL
      connectTimeout: Duration(seconds: 5), // Timeout for connections
      receiveTimeout: Duration(seconds: 5),
    ),
  );

  Dio get dio => dioHelper;
}
