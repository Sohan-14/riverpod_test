import 'package:app/core/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/image_loader.dart';

class FriendsCard extends StatelessWidget {
  const FriendsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSizes.sm,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: GestureDetector(
            onTap: () => context.push(
              RoutePaths.imageFullScreen,
              extra: <String, String>{
                "imagePath":
                    "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
              },
            ),
            child: const ImageLoader(
              imagePath:
                  "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
              width: 60,
              height: 40,
            ),
          ),
        ),
        Column(
          spacing: AppSizes.xs,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Zahidul Islam Shohan",
              style: context.txtTheme.bodyMedium,
            ),
          ],
        ),

        const Spacer(),

        PopupMenuButton<Text>(
          padding: EdgeInsets.zero,
          iconColor: AppColors.black,
          itemBuilder: (BuildContext context) => <PopupMenuItem<Text>>[
            PopupMenuItem<Text>(
              onTap: () {
                context.push(RoutePaths.friendsProfile);
              },
              child: Text(
                'View Profile',
                style: context.txtTheme.bodyMedium,
              ),
            ),
          ],
        ),

        // const ImageLoader(
        //   imagePath: AppIcons.menu,
        //   width: 24.0,
        //   height: 24.0,
        // ),
      ],
    );
  }
}
