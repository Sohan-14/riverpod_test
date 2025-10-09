// lib/features/auth/data/models/user_model.dart
import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entities/user.dart';
part 'user_model.g.dart';

/// User model in the data layer
/// Uses json_serializable for JSON serialization/deserialization
@JsonSerializable(explicitToJson: true)
class UserModel {
  final String id;
  final String email;
  final String? name;
  final String? avatar;
  @JsonKey(name: 'is_email_verified') 
  final bool isEmailVerified;

  // Constructor for creating the UserModel
  const UserModel({
    required this.id,
    required this.email,
    this.name,
    this.avatar,
    required this.isEmailVerified,
  });

  /// Creates a UserModel from a User entity
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      avatar: user.avatar,
      isEmailVerified: user.isEmailVerified,
    );
  }

  /// Creates a User entity from this UserModel
  User toEntity() {
    return User(
      id: id,
      email: email,
      name: name,
      avatar: avatar,
      isEmailVerified: isEmailVerified,
    );
  }

  /// Creates a UserModel from a JSON map
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Converts the UserModel to a JSON map
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
