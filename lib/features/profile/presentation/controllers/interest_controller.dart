import 'package:app/core/api/api_client.dart';
import 'package:app/core/api/api_endpoints.dart';
import 'package:app/core/exceptions/exception_handler.dart';
import 'package:app/core/navigation/app_router.dart';
import 'package:app/core/navigation/route_paths.dart';
import 'package:app/core/providers/app_providers.dart';
import 'package:app/core/utils/app_logger.dart';
import 'package:app/core/utils/toast/toast.dart';
import 'package:app/features/profile/presentation/state/interest_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class InterestNotifier extends Notifier<InterestState> {
  @override
  InterestState build() => const InterestState();

  void setSelectedInterests(List<String> interests) {
    state = state.copyWith(selectedInterests: interests);
  }

  Future<void> submitInterests() async {
    if (state.selectedInterests.isEmpty) {
      state = state.copyWith(formError: "Please select at least one interest");
      return;
    }

    state = state.copyWith(isSubmitting: true, formError: null);

    try {
      final Map<String, dynamic> response = await ref
          .read(apiClientProvider)
          .handleRequest(
            httpMethod: HttpMethod.put,
            endpoint: ApiEndpoints.updateProfile,
            data: <String, List<String>>{
              'interests': state.selectedInterests,
            },
          );

      Toast.showSuccess(response['message'] as String);
      final GoRouter router = ref.read(appRouterProvider);
      router.go(RoutePaths.bottomNav);
    } catch (e) {
      final String message = ExceptionHandler.errorMessage(e);
      state = state.copyWith(formError: message);
      Toast.showError(message);
      AppLogger().e("Update Interests Error", error: e);
    } finally {
      state = state.copyWith(isSubmitting: false);
    }
  }
}
