import 'package:app/core/constants/storage_keys.dart';
import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/storage/secure_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/images.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/provider/role_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Optional: keep splash for 1.5s for branding
    await Future<dynamic>.delayed(const Duration(milliseconds: 1000));

    final String? token = await SecureStorageService().read(
      StorageKeys.accessToken,
    );
    final String? interestPage = await SecureStorageService().read(
      StorageKeys.interestPage,
    );

    final String? shopCompletePage = await SecureStorageService().read(
      StorageKeys.shopCompletePage,
    );

    final String? role = await SecureStorageService().read(StorageKeys.role);

    if (context.mounted) {
      if (token != null && token.isNotEmpty) {
        // User is authenticated
        if (role == 'user') {
          ref.read(selectedRoleProvider.notifier).setRole(Role.user);
          context.go(
            interestPage != null ? RoutePaths.interest : RoutePaths.bottomNav,
          );
        } else if (role == "creator") {
          ref.read(selectedRoleProvider.notifier).setRole(Role.creator);
          context.go(
            interestPage != null ? RoutePaths.interest : RoutePaths.bottomNav,
          );
        } else if (role == "seller") {
          ref.read(selectedRoleProvider.notifier).setRole(Role.seller);
          context.go(
            interestPage != null
                ? RoutePaths.interest
                : shopCompletePage == "not_completed"
                ? RoutePaths.businessInfo
                : RoutePaths.bottomNav,
          );
        } else if (role == "driver") {
          ref.read(selectedRoleProvider.notifier).setRole(Role.driver);
          context.go(
            interestPage != null ? RoutePaths.interest : RoutePaths.bottomNav,
          );
        } else {
          context.go(RoutePaths.onboarding);
        }
      } else {
        context.go(RoutePaths.onboarding);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Center(
          child: Image.asset(
            AppImages.logo,
            width: context.screenWidth * 0.5,
            height: context.screenWidth * 0.5,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
