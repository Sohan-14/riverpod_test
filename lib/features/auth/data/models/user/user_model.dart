import '../../../../../core/constants/database_constants.dart';
import '../../../domain/entities/user.dart';

/// User model in the data layer
class UserModel {
  final String id;
  final String email;
  final String? name;
  final String? avatar;
  final bool isEmailVerified;

  UserModel({
    required this.id,
    required this.email,
    this.name,
    this.avatar,
    required this.isEmailVerified,
  });

  /// Factory method to create a UserModel from a User entity
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      avatar: user.avatar,
      isEmailVerified: user.isEmailVerified,
    );
  }

  /// Convert this UserModel to a User entity
  User toEntity() {
    return User(
      id: id,
      email: email,
      name: name,
      avatar: avatar,
      isEmailVerified: isEmailVerified,
    );
  }

  /// Factory method to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      isEmailVerified: json['is_email_verified'] as bool,
    );
  }

  /// Convert this UserModel to JSON
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'avatar': avatar,
      'is_email_verified': isEmailVerified,
    };
  }

  /// Convert this UserModel to a database map
  Map<String, dynamic> toDatabase() {
    return <String, dynamic>{
      DatabaseConstants.columnId: id,
      DatabaseConstants.columnEmail: email,
      DatabaseConstants.columnName: name,
      DatabaseConstants.columnAvatar: avatar,
      DatabaseConstants.columnIsEmailVerified: isEmailVerified ? 1 : 0,
    };
  }

  /// Factory method to create a UserModel from a database map
  factory UserModel.fromDatabase(Map<String, dynamic> data) {
    return UserModel(
      id: data[DatabaseConstants.columnId] as String,
      email: data[DatabaseConstants.columnEmail] as String,
      name: data[DatabaseConstants.columnName] as String?,
      avatar: data[DatabaseConstants.columnAvatar] as String?,
      isEmailVerified: data[DatabaseConstants.columnIsEmailVerified] == 1,
    );
  }
}
