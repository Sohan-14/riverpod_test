import 'dart:io';

class BusinessInfoState {
  final String businessName;
  final String location;
  final String description;
  final File? profileImage;
  final String? businessNameError;
  final String? locationError;
  final String? descriptionError;
  final String? formError;
  final bool isSubmitting;

  const BusinessInfoState({
    this.businessName = '',
    this.location = '',
    this.description = '',
    this.profileImage,
    this.businessNameError,
    this.locationError,
    this.descriptionError,
    this.formError,
    this.isSubmitting = false,
  });

  BusinessInfoState copyWith({
    String? businessName,
    String? location,
    String? description,
    File? profileImage,
    String? businessNameError,
    String? locationError,
    String? descriptionError,
    String? formError,
    bool? isSubmitting,
  }) {
    return BusinessInfoState(
      businessName: businessName ?? this.businessName,
      location: location ?? this.location,
      description: description ?? this.description,
      profileImage: profileImage ?? this.profileImage,
      businessNameError: businessNameError,
      locationError: locationError,
      descriptionError: descriptionError,
      formError: formError,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }

  bool get isValid =>
      businessNameError == null &&
      locationError == null &&
      descriptionError == null &&
      businessName.isNotEmpty &&
      location.isNotEmpty &&
      description.isNotEmpty;
}
