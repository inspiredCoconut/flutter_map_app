import 'package:flutter/material.dart';

import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../di/database_helper.dart';

final DatabaseHelper databaseHelper = DatabaseHelper.instance;

class AuthService extends ChangeNotifier {
  UserModel? _currentUser;
  final AuthRepository authRepository = AuthRepository(databaseHelper);
  UserModel? get currentUser => _currentUser;

  Future<bool> login(String username, String password) async {
    try {
      UserModel user = await authRepository.loginToken(username, password);
      await authRepository.saveUserDatabase(user);
      //print(user);
      _currentUser = user;
      notifyListeners();
      //print("returning true");
      return true;
    } catch (e) {
      //print(e);
      return false;
    }
  }

  Future<bool> retreiveUser() async {
    try {
      _currentUser = await authRepository.retreiveUserDatabase();
      notifyListeners();
      return _currentUser != null;
    } catch (e) {
      //print(e);
      return false;
    }
  }

  void logout() {
    authRepository.logout();
    _currentUser = null;
    notifyListeners();
  }

  Future<bool> loadUserDatabase() async {
    try {
      _currentUser = await authRepository.retreiveUserDatabase();
      return true;
    } catch (e) {
      //print(e);
      return false;
    }
  }

  Future<bool> isAuthenticatedDatabase() async {
    // ignore: unused_local_variable
    bool status = await loadUserDatabase();
    notifyListeners();
    return _currentUser != null;
  }

  bool isAuthenticated() {
    return _currentUser != null;
  }
}
