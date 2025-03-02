import 'package:flutter_map_app/core/constants/endpoints.dart';

import '../models/user_model.dart';
import '../../core/di/api_helper.dart';

class UserRepository {
  final ApiHelper _apiService = ApiHelper();

  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _apiService.dio.get(Endpoints.users);
      if (response.statusCode == 200) {
        final List<UserModel> users = [];
        for (var user in response.data) {
          users.add(UserModel.fromJson(user));
        }
        return users;
      } else {
        throw Exception('Failed to get users');
      }
    } catch (e) {
      throw Exception('Exception during API call: $e');
    }
  }
}
