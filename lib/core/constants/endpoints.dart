class Endpoints {
  // Api urls
  static const String baseUrl = 'https://api.themoviedb.org/3';

  // Map sources
  static const String openStreetMap =
      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
  static const String openTopoMap =
      'https://{s}.tile.opentopomap.org/{z}/{x}/{y}.png';
  static const String openCycleMap =
      'https://{s}.tile.opencyclemap.org/cycle/{z}/{x}/{y}.png';
  static const String openTransportMap =
      'https://{s}.tile.thunderforest.com/transport/{z}/{x}/{y}.png';

  // Auth endpoints
  static const String requestTokenUrl = '$baseUrl/authentication/token/new';
  static const String registerUrl = '$baseUrl/authentication/token/new';
  static const String loginUrl = '$baseUrl/authentication/token/new';
  static const String loginWithUsernameAndPasswordUrl =
      '$baseUrl/authentication/token/validate_with_login';
  static const String createSessionUrl = '$baseUrl/authentication/session/new';
  static const String sessionUrl = '$baseUrl/authentication/session/new';
  static const String accountUrl = '$baseUrl/account';
  static const String logoutUrl = '$baseUrl/authentication/session';

  // User endpoints
  static const String usersUrl = '$baseUrl/users';
  static const String userUrl = '$baseUrl/users/{id}';
  static const String createUserUrl = '$baseUrl/users';
  static const String updateUserUrl = '$baseUrl/users/{id}';
  static const String deleteUserUrl = '$baseUrl/users/{id}';
}
