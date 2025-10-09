import 'package:json_annotation/json_annotation.dart';
import '../user/user_model.dart';
part 'auth_response_model.g.dart';

/// Authentication response model in the data layer
/// Uses json_serializable for immutability and code generation
@JsonSerializable(explicitToJson: true)
class AuthResponseModel {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  // Constructor for creating the AuthResponseModel
  const AuthResponseModel({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  /// Creates an AuthResponseModel from a JSON map
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  /// Converts the AuthResponseModel to a JSON map
  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}
