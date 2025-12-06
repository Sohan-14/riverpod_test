class User {
  final String id;
  final String name;
  final String email;
  final String? location;
  final DateTime? dateOfBirth;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.location,
    this.dateOfBirth,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      location: json['location'] as String?,
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.tryParse(json['dateOfBirth'] as String? ?? '')
          : null,
    );
  }
}