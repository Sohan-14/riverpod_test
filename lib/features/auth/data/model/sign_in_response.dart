import '../../../../shared/model/token_model.dart';
import '../../../../shared/model/user_model.dart';

class SignInResponse {
  final bool success;
  final int statusCode;
  final String message;
  final UserModel data;
  final TokenModel tokens;

  SignInResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.tokens,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      success: json['success'] as bool,
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      data: UserModel.fromJson(json['data'] as Map<String, dynamic>),
      tokens: TokenModel.fromJson(json['tokens']  as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'success': success,
      'statusCode': statusCode,
      'message': message,
      'data': data.toJson(),
      'tokens': tokens.toJson(),
    };
  }
}




