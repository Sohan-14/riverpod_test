import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../../../../core/utils/toast/toast.dart';
import '../widgets/onboarding_title_section.dart';
import '../widgets/role_container.dart';

class RoleScreen extends StatelessWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.md,
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: AppSizes.spaceBetweenSections),

              const OnboardingTitleSection(
                title: "Choose Your Role",
                subTitle:
                    "Select how you want to use Fouta. You can expand later.",
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              const ImageLoader(
                imagePath: AppIcons.direction,
                height: 80.0,
                width: 60.0,
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: AppSizes.sm,
                  children: <Widget>[
                    SizedBox(
                      width: context.screenWidth * .43,
                      child: RoleContainer(
                        icon: AppIcons.userRole,
                        title: "Standard User",
                        subtitle:
                            "Share posts, stories, and connect with your community.",
                        onTapCallback: () {
                          Toast.showSuccess("Standard User");
                          context.push(RoutePaths.login);
                        },
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * .43,
                      child: RoleContainer(
                        icon: AppIcons.creatorRole,
                        title: "Creator",
                        subtitle:
                            "Create posts, stories, and connect with your community.",
                        onTapCallback: () {
                          Toast.showSuccess("Creator");
                          context.push(RoutePaths.login);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSizes.spaceBetweenSections),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: AppSizes.sm,
                  children: <Widget>[
                    SizedBox(
                      width: context.screenWidth * .43,
                      child: RoleContainer(
                        icon: AppIcons.userRole,
                        title: "Seller",
                        subtitle:
                            "List products, manage sales, and grow your business.",
                        onTapCallback: () {
                          Toast.showSuccess("Seller");
                          context.push(RoutePaths.login);
                        },
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * .43,
                      child: RoleContainer(
                        icon: AppIcons.creatorRole,
                        title: "Delivery Driver",
                        subtitle: "Deliver products and track your earnings.",
                        onTapCallback: () {
                          Toast.showSuccess("Delivery Driver");
                          context.push(RoutePaths.login);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
