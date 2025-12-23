import 'dart:io';

import '../../domain/entities/user_profile.dart';

class ProfileEditState {
  final ProfileEditStatus status;
  final String? errorMessage;
  final UserProfile? profile;
  final String name;
  final String phone;
  final String address;
  final String bio;
  final File? imageFile;
  final String? imageUrl;
  final String? initialImageUrl;
  final bool isUploadingImage;
  final String? uploadError;
  final bool isSubmitting;
  final String? submitError;

  const ProfileEditState({
    this.status = ProfileEditStatus.initial,
    this.errorMessage,
    this.profile,
    this.name = '',
    this.phone = '',
    this.address = '',
    this.bio = '',
    this.imageFile,
    this.imageUrl,
    this.initialImageUrl,
    this.isUploadingImage = false,
    this.uploadError,
    this.isSubmitting = false,
    this.submitError,
  });

  ProfileEditState copyWith({
    ProfileEditStatus? status,
    String? errorMessage,
    UserProfile? profile,
    String? name,
    String? phone,
    String? address,
    String? bio,
    File? imageFile,
    String? imageUrl,
    String? initialImageUrl,
    bool? isUploadingImage,
    String? uploadError,
    bool? isSubmitting,
    String? submitError,
  }) {
    return ProfileEditState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      profile: profile ?? this.profile,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      bio: bio ?? this.bio,
      imageFile: imageFile ?? this.imageFile,
      imageUrl: imageUrl ?? this.imageUrl,
      initialImageUrl: initialImageUrl ?? this.initialImageUrl,
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
      uploadError: uploadError ?? this.uploadError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      submitError: submitError ?? this.submitError,
    );
  }
}

enum ProfileEditStatus { initial, loaded }
