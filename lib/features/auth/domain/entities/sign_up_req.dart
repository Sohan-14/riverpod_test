import '../../../../core/shared/provider/role_provider.dart';

class SignUpReq {
  final String name;
  final String email;
  final String password;
  final String? location;
  final DateTime? dateOfBirth;
  final Role role;

  SignUpReq({
    required this.name,
    required this.email,
    required this.password,
    this.location,
    this.dateOfBirth,
    required this.role,
  });

  Map<String, String> toJson() {
    return <String, String>{
      'name': name,
      'email': email,
      'password': password,
      'location': location ?? '',
      'dateOfBirth': dateOfBirth?.toIso8601String() ?? '',
      'role': role.name.toString(),
    };
  }
}
