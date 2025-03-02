class UserModel {
  int? id;
  final String username;
  final String email;
  final String token;
  final String refreshToken;

  UserModel({this.id, required this.username, required this.email, required this.token, required this.refreshToken});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'token': token,
      'refreshToken': refreshToken,
    };
  }
}
