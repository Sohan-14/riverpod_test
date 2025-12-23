class UserProfileResponse {
  final bool success;
  final int statusCode;
  final String message;
  final UserProfile? data;

  UserProfileResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    this.data,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      success: json['success'] as bool,
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      data: json['data'] != null
          ? UserProfile.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'success': success,
      'statusCode': statusCode,
      'message': message,
      'data': data?.toJson(),
    };
  }

  @override
  String toString() {
    return 'UserProfileResponse(success: $success, statusCode: $statusCode, message: $message, data: $data)';
  }
}

class UserProfile {
  final String id;
  final String name;
  final String role;
  final String? image;
  final String location;
  final DateTime dateOfBirth;
  final String? phone;
  final String? bio;
  final DateTime createdAt;
  final int followingCount;
  final int followedCount;
  final List<dynamic> friends;

  UserProfile({
    required this.id,
    required this.name,
    required this.role,
    this.image,
    required this.location,
    required this.dateOfBirth,
    this.phone,
    this.bio,
    required this.createdAt,
    required this.followingCount,
    required this.followedCount,
    required this.friends,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      image: json['image'] as String?,
      location: json['location'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      phone: json['phone'] as String?,
      bio: json['bio'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      followingCount: json['followingCount'] as int,
      followedCount: json['followedCount'] as int,
      friends: List<dynamic>.from(
        json['friends'] as List<dynamic>? ?? <dynamic>[],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      '_id': id,
      'name': name,
      'role': role,
      'image': image,
      'location': location,
      'bio': bio,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'phone': phone,
      'createdAt': createdAt.toIso8601String(),
      'followingCount': followingCount,
      'followedCount': followedCount,
      'friends': friends,
    };
  }

  @override
  String toString() {
    return 'UserProfile(id: $id, name: $name, role: $role, image: $image, location: $location, dateOfBirth: $dateOfBirth, phone: $phone, createdAt: $createdAt, followingCount: $followingCount, followedCount: $followedCount, friends: $friends)';
  }
}
