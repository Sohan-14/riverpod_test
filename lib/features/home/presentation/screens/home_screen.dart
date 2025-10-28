import 'package:app/core/config/sizes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/navigation/route_paths.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../../../profile/presentation/widgets/post_card.dart';
import '../widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const HomeAppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.xs,
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 16.0),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 2.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        context.push(RoutePaths.storyView);
                      },
                      child: const ClipOval(
                        child: ImageLoader(
                          imagePath:
                              "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                          width: 78,
                          height: 78,
                        ),
                      ),
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 16.0),
                  itemCount: 20,
                ),
              ),

              const SizedBox(height: 16.0),

              ListView.separated(
                itemCount: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return const PostCard();
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      height: AppSizes.md,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
