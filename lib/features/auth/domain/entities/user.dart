import 'package:equatable/equatable.dart';

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

   @override
  String toString() => 'User(id: $id, email: $email, name: $name, isEmailVerified: $isEmailVerified)';
}
