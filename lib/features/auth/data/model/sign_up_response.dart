class SignUpResponse {
  final bool success;
  final int statusCode;
  final String message;
  final SignUpData data;

  SignUpResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      success: json['success'] as bool? ?? false,
      statusCode: json['statusCode'] as int? ?? 000,
      message: json['message'] as String? ?? "Unknown Message",
      data: SignUpData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'success': success,
      'statusCode': statusCode,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class SignUpData {
  final int? oneTimeCode;

  SignUpData({this.oneTimeCode});

  factory SignUpData.fromJson(Map<String, dynamic> json) {
    return SignUpData(
      oneTimeCode: json['oneTimeCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'oneTimeCode': oneTimeCode,
    };
  }
}
