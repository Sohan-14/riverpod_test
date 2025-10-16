import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../../../../core/utils/top_curve_clipper.dart';

class OnboardingFirst extends StatelessWidget {
  final PageController pageController;
  const OnboardingFirst({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minHeight: context.screenHeight,
          minWidth: context.screenWidth,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: context.screenHeight * .4,
              child: ImageLoader(
                imagePath: AppIcons.onboarding1,
                width: context.screenWidth * .5,
                height: context.screenWidth * .5,
              ).centered,
            ),
            ClipPath(
              clipper: TopCurveClipper(),
              child: Container(
                height: context.screenHeight * .4,
                width: context.screenWidth,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 64.0,
                    ),
                    Text(
                      "Let’s Get Started with Fouta App",
                      textAlign: TextAlign.center,
                      style: context.txtTheme.displaySmall?.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      "Connect, share, buy, and sell – all in one place.",
                      textAlign: TextAlign.center,
                      style: context.txtTheme.bodyMedium?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            pageController.jumpToPage(1);
                          },
                          child: Text(
                            "Next",
                            style: context.txtTheme.bodyLarge?.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.go(RoutePaths.role);
                          },
                          child: Text(
                            "Skip",
                            style: context.txtTheme.bodyLarge?.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.md,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: AppSizes.md,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.secondary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: context.screenWidth * .25,
                          height: 10.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: context.screenWidth * .25,
                          height: 10.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: context.screenWidth * .25,
                          height: 10.0,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBetweenSections,
                    ),
                  ],
                ),
              ),
            ).expanded,
          ],
        ),
      ),
    );
  }
}
