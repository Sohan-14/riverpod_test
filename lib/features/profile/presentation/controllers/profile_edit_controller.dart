import 'dart:io';

import 'package:app/core/api/api_endpoints.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/exceptions/exception_handler.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../core/utils/app_logger.dart';
import '../../domain/entities/user_profile.dart';
import '../providers/profile_providers.dart';
import '../state/profile_edit_state.dart';

class ProfileEditNotifier extends Notifier<ProfileEditState> {
  bool _initialized = false;

  @override
  ProfileEditState build() {
    return const ProfileEditState();
  }

  void initializeWithProfile(UserProfile profile) {
    if (_initialized){
      return;
    }
    _initialized = true;

    state = ProfileEditState(
      status: ProfileEditStatus.loaded,
      profile: profile,
      name: profile.name,
      phone: profile.phone ?? '',
      address: profile.location,
      bio: '', // or profile.bio if exists
      initialImageUrl: profile.image,
      imageUrl: profile.image,
    );
  }

  void setName(String v) => state = state.copyWith(name: v);
  void setPhone(String v) => state = state.copyWith(phone: v);
  void setAddress(String v) => state = state.copyWith(address: v);
  void setBio(String v) => state = state.copyWith(bio: v);

  void setImageFile(File? file) {
    state = state.copyWith(imageFile: file);
    if (file != null) {
      _uploadImage(file);
    }
  }

  Future<void> _uploadImage(File file) async {
    state = state.copyWith(isUploadingImage: true);
    try {
      final Map<String, List<File>> fileFields = <String, List<File>>{};
      fileFields["image"] = <File>[file];

      final ApiClient client = ref.read(apiClientProvider);
      final Map<String, dynamic> res = await client
          .handleRequest<Map<String, dynamic>>(
            httpMethod: HttpMethod.put,
            endpoint: ApiEndpoints.updateProfile,
            fileFields: fileFields,
          );
      state = state.copyWith(
        isUploadingImage: false,
        // ignore: avoid_dynamic_calls
        imageUrl: res['data']['image'] as String,
        uploadError: "",
      );
    } catch (e) {
      final String msg = ExceptionHandler.errorMessage(e);
      AppLogger().e("Upload failed", error: e);
      state = state.copyWith(
        isUploadingImage: false,
        imageFile: null,
        uploadError: msg,
      );
    }
  }

  Future<void> updateProfile() async {
    if (state.status != ProfileEditStatus.loaded) {
      return;
    }

    state = state.copyWith(isSubmitting: true, submitError: null);
    try {
      final ApiClient client = ref.read(apiClientProvider);
      await client.handleRequest<void>(
        httpMethod: HttpMethod.put,
        endpoint: ApiEndpoints.updateProfile,
        data: <String, String?>{
          'name': state.name.trim(),
          'phone': state.phone.trim(),
          'location': state.address.trim(),
          'bio': state.bio.trim(),
        },
      );
      ref.invalidate(userProfileProvider);
      state = state.copyWith(isSubmitting: false);
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        submitError: ExceptionHandler.errorMessage(e),
      );
    }
  }
}
