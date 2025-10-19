import 'package:flutter/material.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/extensions/widget_extensions.dart';
import '../../../../core/shared/widgets/app_outline_button.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index != _selectedIndex) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontal,
            vertical: AppSizes.md,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const ProfileCard(),
              const SizedBox(
                height: AppSizes.md,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: AppColors.primary),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: TabBar(
                  controller: _tabController,
                  dividerHeight: 0.0,
                  indicatorColor: Colors.transparent,
                  tabs: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm,
                        vertical: AppSizes.sm,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: _selectedIndex == 0
                            ? AppColors.primary
                            : Colors.transparent,
                      ),
                      child: Text(
                        "Post",
                        style: context.txtTheme.bodyMedium?.copyWith(
                          color: _selectedIndex == 0
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm,
                        vertical: AppSizes.sm,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: _selectedIndex == 1
                            ? AppColors.primary
                            : Colors.transparent,
                      ),
                      child: Text(
                        "Photos",
                        style: context.txtTheme.bodyMedium?.copyWith(
                          color: _selectedIndex == 1
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm,
                        vertical: AppSizes.sm,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: _selectedIndex == 2
                            ? AppColors.primary
                            : Colors.transparent,
                      ),
                      child: Text(
                        "Video",
                        style: context.txtTheme.bodyMedium?.copyWith(
                          color: _selectedIndex == 2
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm,
                        vertical: AppSizes.sm,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: _selectedIndex == 3
                            ? AppColors.primary
                            : Colors.transparent,
                      ),
                      child: Text(
                        "Friends",
                        style: context.txtTheme.bodyMedium?.copyWith(
                          color: _selectedIndex == 3
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSizes.md,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Container(
                      color: Colors.amber,
                    ),
                    Container(
                      color: Colors.redAccent,
                    ),
                    Container(
                      color: Colors.pinkAccent,
                    ),
                    Container(
                      color: Colors.lightGreenAccent,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const ClipOval(
            child: ImageLoader(
              imagePath:
                  "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
              width: 160,
              height: 160,
            ),
          ).centered,

          const SizedBox(
            height: AppSizes.spaceBetweenSections,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Zahidul Islam Shohan",
                style: context.txtTheme.bodyLarge,
              ),
              Text(
                "50 followers",
                style: context.txtTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                ),
              ),
              Text(
                "20 following",
                style: context.txtTheme.bodyMedium?.copyWith(
                  color: AppColors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(
            height: AppSizes.md,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: context.screenWidth * .4,
                height: 40,
                child: const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ClipOval(
                        child: ImageLoader(
                          imagePath:
                              "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      ClipOval(
                        child: ImageLoader(
                          imagePath:
                              "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      ClipOval(
                        child: ImageLoader(
                          imagePath:
                              "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      ClipOval(
                        child: ImageLoader(
                          imagePath:
                              "https://images.unsplash.com/photo-1600180758890-6b94519a8ba6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmVzc2lvbmFsJTIwcHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D&fm=jpg&q=60&w=3000",
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppOutlineButton(
                width: 100,
                icon: const Icon(
                  Icons.edit,
                  color: AppColors.primary,
                ),
                onPressed: () {},
                label: "Edit",
                outlineColor: AppColors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
