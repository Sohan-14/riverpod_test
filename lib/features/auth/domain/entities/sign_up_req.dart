class SignUpReq {
  final String name;
  final String email;
  final String password;
  final String? location;
  final DateTime? dateOfBirth;

  SignUpReq({
    required this.name,
    required this.email,
    required this.password,
    this.location,
    this.dateOfBirth,
  });

  Map<String, String> toJson() {
    return <String, String>{
      'name': name,
      'email': email,
      'password': password,
      'location': location ?? '',
      'dateOfBirth': dateOfBirth?.toIso8601String() ?? '',
    };
  }
}
