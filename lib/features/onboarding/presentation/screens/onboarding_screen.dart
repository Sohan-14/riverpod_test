import 'package:flutter/material.dart';

import '../../../../core/config/colors.dart';
import '../widgets/onboarding_first.dart';
import '../widgets/onboarding_second.dart';
import '../widgets/onboarding_third.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            OnboardingFirst(pageController: _pageController),
            OnboardingSecond(pageController: _pageController),
            OnboardingThird(pageController: _pageController),
          ],
        ),
      ),
    );
  }
}
