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
  static const String requestTokenUrl = '/authentication/token/new';
  static const String registerUrl = '/authentication/token/new';
  static const String loginUrl = '/authentication/token/new';
  static const String loginWithUsernameAndPasswordUrl =
      '/authentication/token/validate_with_login';
  static const String createSessionUrl = '/authentication/session/new';
  static const String sessionUrl = '/authentication/session/new';
  static const String accountUrl = '/account';
  static const String updateProfileUrl = '/account';
  static const String logoutUrl = '/authentication/session';


  // User endpoints
  static const String users = '/users/';
  static const String usersUrl = '/users';
  static const String userUrl = '/users/{id}';
  static const String createUserUrl = '/users';
  static const String updateUserUrl = '/users/{id}';
  static const String deleteUserUrl = '/users/{id}';
  
  // Auth 
  static const String login = '/auth/token/';
  static const String reLogin = '/auth/token/refresh/';

}
