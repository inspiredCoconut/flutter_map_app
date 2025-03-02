import '../core/service/auth_service.dart';

class AuthPresenter {
  final AuthService _authService;

  AuthPresenter(this._authService);

  Future<bool> login(String username, String password) => _authService.login(username, password);

  bool isAuthenticated() => _authService.isAuthenticated();

  Future<bool> isAuthenticatedDatabase() => _authService.isAuthenticatedDatabase();

  void logout() => _authService.logout();
}