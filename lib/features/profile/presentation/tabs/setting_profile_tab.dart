import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/config/sizes.dart';
import '../widgets/settings_item.dart';

class SettingProfileTab extends StatelessWidget {
  const SettingProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: AppSizes.md,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SettingItems(
            icon: Icons.lock_outlined,
            label: "Change Password",
            onTapCallback: () {},
          ),
          SettingItems(
            icon: Icons.privacy_tip_outlined,
            label: "Privacy Policy",
            onTapCallback: () {},
          ),
          SettingItems(
            icon: Icons.warning_amber_rounded,
            label: "Terms & Condition",
            onTapCallback: () {},
          ),
          SettingItems(
            icon: Icons.info_outline,
            label: "Contact Us",
            onTapCallback: () {},
          ),
          SettingItems(
            icon: Icons.logout,
            label: "Logout",
            onTapCallback: () {},
          ),
        ],
      ),
    );
  }
}
