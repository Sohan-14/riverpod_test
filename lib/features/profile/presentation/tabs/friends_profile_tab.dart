import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/sizes.dart';
import '../widgets/friends_card.dart';

class FriendsProfileTab extends StatelessWidget {
  const FriendsProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: AppSizes.md,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "My Friends",
                style: context.txtTheme.bodyMedium,
              ),
              Text(
                "5 friends",
                style: context.txtTheme.bodyMedium,
              ),
            ],
          ),

          const SizedBox(
            height: AppSizes.sm,
          ),

          ListView.separated(
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return const FriendsCard();
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  height: AppSizes.md,
                ),
          ),
        ],
      ),
    );
  }
}
