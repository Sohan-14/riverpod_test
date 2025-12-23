// features/profile/presentation/widgets/info_profile_tab.dart

import 'package:app/features/profile/domain/entities/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/sizes.dart';
import '../providers/profile_providers.dart';
import '../widgets/info_item.dart';

class InfoProfileTab extends ConsumerWidget {
  const InfoProfileTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<UserProfile?> userProfileAsync = ref.watch(
      userProfileProvider,
    );

    return userProfileAsync.when(
      loading: () => _buildPlaceholder(),
      error: (Object error, StackTrace? stack) => _buildPlaceholder(),
      data: (UserProfile? userProfile) {
        if (userProfile == null) {
          return _buildPlaceholder();
        }

        return Column(
          spacing: AppSizes.md,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InfoItem(
              icon: CupertinoIcons.person,
              label: "Name",
              value: userProfile.name,
            ),
            InfoItem(
              icon: CupertinoIcons.info,
              label: "About",
              value: userProfile.bio ?? "Not provided",
            ),
            InfoItem(
              icon: CupertinoIcons.phone,
              label: "Phone",
              value: userProfile.phone ?? "Not provided",
            ),
            InfoItem(
              icon: Icons.location_on_outlined,
              label: "Address",
              value: userProfile.location,
            ),
          ],
        );
      },
    );
  }

  Widget _buildPlaceholder() {
    return const Column(
      spacing: AppSizes.md,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InfoItem(
          icon: CupertinoIcons.person,
          label: "Name",
          value: "Loading...",
        ),
        InfoItem(
          icon: CupertinoIcons.info,
          label: "About",
          value: "Loading...",
        ),
        InfoItem(
          icon: CupertinoIcons.phone,
          label: "Phone",
          value: "Loading...",
        ),
        InfoItem(
          icon: Icons.location_on_outlined,
          label: "Address",
          value: "Loading...",
        ),
      ],
    );
  }
}
