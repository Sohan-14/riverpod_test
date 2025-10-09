import 'package:equatable/equatable.dart';

/// User entity in the domain layer
class User extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? avatar;
  final bool isEmailVerified;

  const User({
    required this.id,
    required this.email,
    this.name,
    this.avatar,
    required this.isEmailVerified,
  });

  @override
  List<Object?> get props => <Object?>[
    id,
    email,
    name,
    avatar,
    isEmailVerified,
  ];
}
