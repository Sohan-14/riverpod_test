
import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';

class ParcelRequestHistoryTab extends StatelessWidget {
  const ParcelRequestHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListView.separated(
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  height: AppSizes.sm,
                ),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => context.push(RoutePaths.taskDetails),
                    child: Container(
                      margin: const EdgeInsets.only(left: 30),
                      padding: const EdgeInsets.all(AppSizes.sm),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary, width: 1.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(AppSizes.xs),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.primary,
                                width: .5,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "John",
                                  style: context.txtTheme.bodyMedium,
                                ),
                                Text(
                                  "Seller",
                                  style: context.txtTheme.bodyMedium?.copyWith(
                                    color: AppColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    
                          const SizedBox(
                            height: AppSizes.spaceBetweenItems,
                          ),
                    
                          Row(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: AppSizes.sm,
                                children: <Widget>[
                                  Text(
                                    "Pick-Up",
                                    style: context.txtTheme.bodyMedium?.copyWith(
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Text(
                                    "120 Main Street,10 number apartment, dhaka,1206, Dhaka",
                                    style: context.txtTheme.bodyMedium,
                                  ),
                                ],
                              ).expanded,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: AppSizes.sm,
                                children: <Widget>[
                                  Text(
                                    "Pick-Off",
                                    style: context.txtTheme.bodyMedium?.copyWith(
                                      color: AppColors.grey,
                                    ),
                                  ),
                                  Text(
                                    "120 Main Street,10 number apartment, dhaka,1206, Dhaka",
                                    style: context.txtTheme.bodyMedium,
                                  ),
                                ],
                              ).expanded,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: AppColors.grey,
                      ),
                      child: Text(
                        index.toString(),
                        style: context.txtTheme.bodyMedium,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
