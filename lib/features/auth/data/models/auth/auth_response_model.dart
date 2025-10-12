import '../user/user_model.dart';

class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  AuthResponseModel({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  /// Factory method to create a UserModel from JSON
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      user: json['user'] as UserModel,
      accessToken: json['accessTokens'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }

  /// Convert this AuthResponseModel to JSON
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user': user,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}