import 'dart:io';
import 'package:app/core/api/api_client.dart';
import 'package:app/core/api/api_endpoints.dart';
import 'package:app/core/exceptions/exception_handler.dart';
import 'package:app/core/navigation/app_router.dart';
import 'package:app/core/navigation/route_paths.dart';
import 'package:app/core/providers/app_providers.dart';
import 'package:app/core/utils/app_logger.dart';
import 'package:app/core/utils/app_validation.dart';
import 'package:app/core/utils/toast/toast.dart';
import 'package:app/features/onboarding/presentation/state/business_info_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/storage_keys.dart';
import '../../../../core/storage/secure_storage_service.dart';

class BusinessInfoNotifier extends Notifier<BusinessInfoState> {
  @override
  BusinessInfoState build() => const BusinessInfoState();

  void setBusinessName(String value) {
    state = state.copyWith(
      businessName: value,
      businessNameError: AppValidation.validateRequired(
        value,
        fieldName: "Business Name",
      ),
      formError: null,
    );
  }

  void setLocation(String value) {
    state = state.copyWith(
      location: value,
      locationError: AppValidation.validateRequired(
        value,
        fieldName: "Business Location",
      ),
      formError: null,
    );
  }

  void setDescription(String value) {
    state = state.copyWith(
      description: value,
      descriptionError: AppValidation.validateRequired(
        value,
        fieldName: "Business Description",
      ),
      formError: null,
    );
  }

  void setProfileImage(File? file) {
    state = state.copyWith(profileImage: file);
  }

  Future<void> submitBusinessInfo() async {
    // Final validation
    final String? nameErr = state.businessName.trim().isEmpty
        ? "Business name is required"
        : null;
    final String? locErr = state.location.trim().isEmpty
        ? "Location is required"
        : null;
    final String? descErr = state.description.trim().isEmpty
        ? "Description is required"
        : null;

    state = state.copyWith(
      businessNameError: nameErr,
      locationError: locErr,
      descriptionError: descErr,
      formError: null,
    );

    if (nameErr != null || locErr != null || descErr != null) {
      return;
    }

    if (state.profileImage == null) {
      return Toast.showWarning(
        "Please provide a image for your business profile",
      );
    }

    state = state.copyWith(isSubmitting: true);

    try {
      final Map<String, dynamic> data = <String, dynamic>{
        'name': state.businessName.trim(),
        'location': state.location.trim(),
        'description': state.description.trim(),
      };

      final Map<String, List<File>> fileFields = <String, List<File>>{};
      fileFields["image"] = <File>[state.profileImage!];

      final Map<String, dynamic> response = await ref
          .read(apiClientProvider)
          .handleRequest(
            httpMethod: HttpMethod.put,
            endpoint: ApiEndpoints.updateSellerProfile,
            fileFields: fileFields,
            data: data,
          );

      await SecureStorageService().delete(
        StorageKeys.shopCompletePage,
      );
      Toast.showSuccess(response['message'] as String);
      final GoRouter router = ref.read(appRouterProvider);
      router.go(RoutePaths.bottomNav);
    } catch (e) {
      final String message = ExceptionHandler.errorMessage(e);
      state = state.copyWith(formError: message);
      Toast.showError(message);
      AppLogger().e("Business Info Submit Error", error: e);
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }
}
