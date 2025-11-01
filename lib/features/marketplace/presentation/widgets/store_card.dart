import 'package:app/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/app_elevated_button.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RoutePaths.storeDetails);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.sm,
          vertical: AppSizes.sm,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: GestureDetector(
                onTap: () => context.push(
                  RoutePaths.imageFullScreen,
                  extra: <String, String>{
                    "imagePath":
                        "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2xvdGhpbmclMjBzdG9yZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                  },
                ),
                child: const ImageLoader(
                  imagePath:
                      "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2xvdGhpbmclMjBzdG9yZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                  width: double.infinity,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.sm,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  spacing: AppSizes.xs,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "ShopNow Store",
                      style: context.txtTheme.bodyLarge,
                    ),

                    Text(
                      "Gulsan Dhaka",
                      style: context.txtTheme.bodySmall,
                    ),
                  ],
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(Icons.star_rounded, color: AppColors.secondary),
                    Text(
                      "(4.8)",
                      style: context.txtTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(
              height: AppSizes.sm,
            ),

            AppElevatedButton(
              width: 30,
              height: 30,
              onPressed: () {},
              label: "Chat",
              icon: const ImageLoader(
                imagePath: AppIcons.chatBottomNav,
                color: AppColors.white,
              ),
            ),

            const SizedBox(
              height: AppSizes.sm,
            ),

            SizedBox(
              height: 50,
              child: ListView.separated(
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      width: AppSizes.sm,
                    ),
                itemBuilder: (_, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: GestureDetector(
                      onTap: () => context.push(
                        RoutePaths.imageFullScreen,
                        extra: <String, String>{
                          "imagePath":
                              "https://www.victoriassecret.com/p/504x672/png/zz/25/09/26/14/112696011885_OM_S.jpg",
                        },
                      ),
                      child: const ImageLoader(
                        imagePath:
                            "https://www.victoriassecret.com/p/504x672/png/zz/25/09/26/14/112696011885_OM_S.jpg",
                        width: 40,
                        height: 40,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
