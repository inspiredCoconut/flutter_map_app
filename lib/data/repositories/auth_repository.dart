import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../core/di/database_helper.dart';
import '../models/user_model.dart';
import '../../core/constants/endpoints.dart';
import '../../core/di/api_helper.dart';

class AuthRepository {
  final DatabaseHelper databaseHelper;
  final Dio dio = ApiHelper().dio;

  AuthRepository(this.databaseHelper);

  Future<Database> get database => databaseHelper.database;
  
  Future<UserModel> loginToken(String username, String password) async {
    try {
      final response = await dio.post(
        Endpoints.login,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: jsonEncode({'username': username, 'password': password}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        UserModel user = UserModel(
          username: username,
          email: "",
          token: data['access'],
          refreshToken: data['refresh'],
        );
        return user;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  Future<bool> logout() async {
    final Database db = await database;
    await db.delete('users');
    return true;
  }

  Future<UserModel> saveUserDatabase(UserModel user) async {
    final Database db = await database;
    await db.insert('users', user.toJson());
    return user;
  }

  Future<UserModel> retreiveUserDatabase() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users', orderBy: 'id DESC');
    if (maps.isNotEmpty) {
      return UserModel.fromJson(maps[0]);
    } else {
      throw Exception('User not found');
    }
  }
}
