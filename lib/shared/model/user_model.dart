class UserModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String? image;
  final bool isEmailVerified;
  final bool isDeleted;
  final List<String> interests;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.image,
    required this.isEmailVerified,
    required this.isDeleted,
    required this.interests,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      image: json['image'] as String?,
      isEmailVerified: json['isEmailVerified'] as bool,
      isDeleted: json['isDeleted'] as bool,
      interests: json['interests'] != null
          ? List<String>.from(
              (json['interests'] as List<dynamic>).map(
                (dynamic e) => e.toString(),
              ),
            )
          : <String>[],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'email': email,
      'role': role,
      'image': image,
      'isEmailVerified': isEmailVerified,
      'isDeleted': isDeleted,
      'interests': interests,
    };
  }
}
