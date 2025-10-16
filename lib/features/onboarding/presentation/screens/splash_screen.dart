import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/images.dart';
import '../../../../core/navigation/route_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextRoute();
  }

  Future<void> goToNextRoute() async {
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 1500),
    );
    if (context.mounted) {
      context.go(RoutePaths.onboarding);
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
            width: context.screenWidth * .5,
            height: context.screenWidth * .5,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
