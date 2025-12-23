import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/api/api_client.dart';
import '../../../../core/api/api_endpoints.dart';
// import '../../../../core/exceptions/exception_handler.dart';
import '../../../../core/providers/app_providers.dart';
import '../../../../core/utils/app_logger.dart';
import '../../domain/entities/user_profile.dart';

class UserProfileNotifier extends AsyncNotifier<UserProfile?> {
  @override
  Future<UserProfile?> build() async {
    return _fetchProfile();
  }

  Future<UserProfile?> _fetchProfile() async {
    try {
      final ApiClient apiClient = ref.read(apiClientProvider);

      final UserProfileResponse response = await apiClient
          .handleRequest<UserProfileResponse>(
            httpMethod: HttpMethod.get,
            endpoint: ApiEndpoints.userProfile,
            fromJson: UserProfileResponse.fromJson,
          );

      return response.data;
    } catch (e) {
      AppLogger().e("Failed to fetch user profile", error: e);
      return null;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading<UserProfile?>();
    final UserProfile? profile = await _fetchProfile();
    state = AsyncData<UserProfile?>(profile);
  }
}
