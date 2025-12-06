class SignInResponse {
  final String token;
  final String userId;

  SignInResponse({required this.token, required this.userId});

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      token: json['token'] as String,
      userId: json['user_id'] as String,
    );
  }
}