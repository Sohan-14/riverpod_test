import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Import Riverpod
import 'package:go_router/go_router.dart'; // Assuming GoRouter for navigation
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/provider/role_provider.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../../../../core/utils/toast/toast.dart';
import '../widgets/onboarding_title_section.dart';
import '../widgets/role_container.dart';

// RoleScreen now uses ConsumerWidget to interact with Riverpod state
class RoleScreen extends ConsumerWidget {
  const RoleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

              // Horizontal scrolling for roles
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
                          // Update the role in Riverpod using Notifier
                          ref.read(selectedRoleProvider.notifier).setRole =
                              Role.user;
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
                          // Update the role in Riverpod using Notifier
                          ref.read(selectedRoleProvider.notifier).setRole =
                              Role.creator;
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
                        icon: AppIcons.sellerRole,
                        title: "Seller",
                        subtitle:
                            "List products, manage sales, and grow your business.",
                        onTapCallback: () {
                          // Update the role in Riverpod using Notifier
                          ref.read(selectedRoleProvider.notifier).setRole =
                              Role.seller;
                          Toast.showSuccess("Seller");
                          context.push(RoutePaths.login);
                        },
                      ),
                    ),
                    SizedBox(
                      width: context.screenWidth * .43,
                      child: RoleContainer(
                        icon: AppIcons.driverRole,
                        title: "Delivery Driver",
                        subtitle: "Deliver products and track your earnings.",
                        onTapCallback: () {
                          // Update the role in Riverpod using Notifier
                          ref.read(selectedRoleProvider.notifier).setRole =
                              Role.driver;
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
