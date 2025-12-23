// features/profile/presentation/widgets/profile_card.dart

import 'package:app/features/profile/domain/entities/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/icons.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/provider/role_provider.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/shared/widgets/app_outline_button.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../providers/profile_providers.dart';

// Helper to parse role string to enum (keep consistent with role_provider)
Role? _parseRole(String? roleString) {
  if (roleString == null) {
    return null;
  }
  switch (roleString.toLowerCase()) {
    case 'creator':
      return Role.creator;
    case 'seller':
      return Role.seller;
    case 'driver':
      return Role.driver;
    default:
      return null;
  }
}

class ProfileCard extends ConsumerWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<UserProfile?> userProfileAsync = ref.watch(
      userProfileProvider,
    );

    return userProfileAsync.when(
      loading: () => _buildLoadingCard(context),
      error: (Object error, StackTrace? stack) =>
          _buildErrorCard(context, 'Failed to load profile'),
      data: (UserProfile? userProfile) {
        if (userProfile == null) {
          return _buildErrorCard(context, 'Profile data unavailable');
        }
        return _buildContent(context, ref, userProfile);
      },
    );
  }

  Widget _buildLoadingCard(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.lg,
      ),
      decoration: BoxDecoration(
        color: AppColors.silver,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            backgroundColor: AppColors.grey,
          ),
          SizedBox(height: AppSizes.spaceBetweenSections),
          Text(
            "Loading profile...",
            style: TextStyle(color: AppColors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorCard(BuildContext context, String message) {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.lg,
      ),
      decoration: BoxDecoration(
        color: AppColors.silver,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WidgetRef ref,
    UserProfile profile,
  ) {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
      ),
      decoration: BoxDecoration(
        color: AppColors.silver,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: AppSizes.sm),
          ClipOval(
            child: ImageLoader(
              imagePath: profile.image?.trim().isNotEmpty == true
                  ? profile.image!
                  : "https://via.placeholder.com/160",
              width: 160,
              height: 160,
            ),
          ).centered,

          const SizedBox(height: AppSizes.sm),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                profile.name,
                style: context.txtTheme.bodyLarge,
              ),
              Text(
                "${profile.followedCount} followers",
                style: context.txtTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Text(
                "${profile.followingCount} following",
                style: context.txtTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSizes.sm),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: context.screenWidth * 0.4,
                height: 40,
                child: profile.friends.isEmpty
                    ? const Text(
                        "No friends",
                        style: TextStyle(fontSize: 12, color: AppColors.grey),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List<Padding>.generate(
                            profile.friends.length.clamp(0, 4),
                            (int index) {
                              final dynamic friend = profile.friends[index];
                              String imageUrl =
                                  "https://via.placeholder.com/30";
                              if (friend is Map && friend['image'] != null) {
                                imageUrl = friend['image'] as String;
                              } else if (friend is String) {
                                imageUrl = friend;
                              }
                              return Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: ClipOval(
                                  child: ImageLoader(
                                    imagePath: imageUrl,
                                    width: 30,
                                    height: 30,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ),
              AppOutlineButton(
                width: 100,
                height: 30,
                icon: const Icon(
                  Icons.edit,
                  color: AppColors.primary,
                ),
                onPressed: () {
                  context.push(RoutePaths.profileEdit, extra: profile);
                },
                label: "Edit",
                outlineColor: AppColors.primary,
              ),
            ],
          ),

          const SizedBox(height: AppSizes.spaceBetweenItems),

          // Role-based action button
          _buildRoleActionButton(context, profile.role),
        ],
      ),
    );
  }

  Widget _buildRoleActionButton(BuildContext context, String? roleString) {
    final Role? role = _parseRole(roleString);

    if (role == Role.creator) {
      return AppElevatedButton(
        icon: const ImageLoader(
          imagePath: AppIcons.advertise,
          width: 24.0,
          height: 24.0,
          color: AppColors.white,
        ),
        onPressed: () => context.push(RoutePaths.ads),
        label: "Advertise",
      );
    } else if (role == Role.seller) {
      return AppElevatedButton(
        icon: const ImageLoader(
          imagePath: AppIcons.order,
          width: 24.0,
          height: 24.0,
          color: AppColors.white,
        ),
        onPressed: () => context.push(RoutePaths.productOrders),
        label: "Orders",
      );
    } else if (role == Role.driver) {
      return AppElevatedButton(
        icon: const ImageLoader(
          imagePath: AppIcons.parcelRequest,
          width: 24.0,
          height: 24.0,
          color: AppColors.white,
        ),
        onPressed: () => context.push(RoutePaths.parcelRequest),
        label: "Request",
      );
    }

    return const SizedBox.shrink();
  }
}
