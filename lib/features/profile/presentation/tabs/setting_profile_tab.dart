import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/shared/widgets/app_elevated_button.dart';
import 'package:app/core/shared/widgets/app_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/utils/bottom_sheet/custom_bottom_sheet.dart';
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
            onTapCallback: () {
              context.push(RoutePaths.changePassword);
            },
          ),
          SettingItems(
            icon: Icons.privacy_tip_outlined,
            label: "Privacy Policy",
            onTapCallback: () {
              context.push(RoutePaths.privacyPolicy);
            },
          ),
          SettingItems(
            icon: Icons.warning_amber_rounded,
            label: "Terms & Condition",
            onTapCallback: () {
              context.push(RoutePaths.termsCondition);
            },
          ),
          SettingItems(
            icon: Icons.info_outline,
            label: "Contact Us",
            onTapCallback: () {
              context.push(RoutePaths.contactUs);
            },
          ),
          SettingItems(
            icon: Icons.logout,
            label: "Logout",
            onTapCallback: () {
              CustomBottomSheet.show<Column>(
                context: context,
                child: Column(
                  spacing: 4.0,
                  children: <Widget>[
                    Text(
                      "Logout",
                      style: context.txtTheme.headlineLarge?.copyWith(
                        color: Colors.redAccent,
                      ),
                    ),
                    Text(
                      "Are you sure you want to logout?",
                      style: context.txtTheme.bodyMedium,
                    ),

                    const SizedBox(
                      height: AppSizes.spaceBetweenItems,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: AppSizes.md,
                      children: <Widget>[
                        AppOutlineButton(
                          width: 100,
                          outlineColor: Colors.redAccent,
                          label: "Cancel",
                          onPressed: () {
                            context.pop();
                          },
                        ),
                        AppElevatedButton(
                          width: 100,
                          label: "Logout",
                          onPressed: () {
                            context.go(RoutePaths.role);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
