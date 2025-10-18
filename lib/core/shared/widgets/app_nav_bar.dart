import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../config/colors.dart';
import '../../config/sizes.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onTabTapped,
  });

  final List<NavItem> items;
  final int selectedIndex;
  final ValueChanged<int> onTabTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: AppSizes.md, bottom: AppSizes.md),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            border: Border(
              top: BorderSide(
                color: AppColors.primary,
                width: 4.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<Widget>.generate(
              items.length,
              (int index) {
                final bool isSelected = selectedIndex == index;
                return GestureDetector(
                  onTap: () => onTabTapped(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : Colors.transparent,
                      borderRadius: isSelected
                          ? BorderRadius.circular(16.0)
                          : null,
                    ),
                    child: Column(
                      children: <Widget>[
                        SvgPicture.asset(
                          isSelected
                              ? items[index].activeIconPath
                              : items[index].iconPath,
                          height: AppSizes.iconMd,
                          width: AppSizes.iconMd,
                          colorFilter: ColorFilter.mode(
                            isSelected ? AppColors.white : AppColors.black,
                            BlendMode.srcATop,
                          ),
                        ),
                        // const SizedBox(height: AppSizes.xs),
                        // Text(
                        //   items[index].label,
                        //   style: context.txtTheme.bodySmall?.copyWith(
                        //     color: isSelected
                        //         ? AppColors.primary
                        //         : AppColors.black,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class NavItem {
  NavItem({
    required this.iconPath,
    required this.activeIconPath,
    required this.label,
  });

  final String iconPath;
  final String activeIconPath;
  final String label;
}
