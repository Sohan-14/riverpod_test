import 'package:app/core/extensions/context_extensions.dart';
import 'package:app/core/extensions/widget_extensions.dart';
import 'package:app/core/shared/widgets/app_outline_button.dart';
import 'package:app/core/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../../../../core/shared/widgets/image_loader.dart';
import '../tabs/friends_profile_tab.dart';
import '../tabs/gallery_profile_tab.dart';
import '../tabs/info_profile_tab.dart';
import '../tabs/post_profile_tab.dart';
import '../widgets/tab_item.dart';

class FriendsProfileScreen extends StatefulWidget {
  const FriendsProfileScreen({super.key});

  @override
  State<FriendsProfileScreen> createState() => _FriendsProfileScreenState();
}

class _FriendsProfileScreenState extends State<FriendsProfileScreen>
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
      appBar: const CustomAppBar(
        title: "Friends Profile",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.screenHorizontal,
              vertical: AppSizes.md,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const ProfileCard(),
                const SizedBox(height: AppSizes.md),

                // TabBar
                Container(
                  padding: const EdgeInsets.symmetric(vertical: AppSizes.xs),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    border: Border.all(width: 1.0, color: AppColors.primary),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    dividerHeight: 0.0,
                    indicatorColor: Colors.transparent,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: <Widget>[
                      TabItem(
                        selectedIndex: _selectedIndex,
                        index: 0,
                        label: "Info",
                        icon: AppIcons.info,
                      ),
                      TabItem(
                        selectedIndex: _selectedIndex,
                        index: 1,
                        label: "Posts",
                        icon: AppIcons.addBottomNav,
                      ),
                      TabItem(
                        selectedIndex: _selectedIndex,
                        label: "Gallery",
                        index: 2,
                        icon: AppIcons.gallery,
                      ),
                      TabItem(
                        selectedIndex: _selectedIndex,
                        label: "Friends",
                        index: 3,
                        icon: AppIcons.friends,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.md),

                if (_selectedIndex == 0) const InfoProfileTab(),
                if (_selectedIndex == 1) const PostProfileTab(),
                if (_selectedIndex == 2) const GalleryProfileTab(),
                if (_selectedIndex == 3) const FriendsProfileTab(),
              ],
            ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Zahidul Islam Shohan",
                    style: context.txtTheme.bodyLarge,
                  ),
                  AppOutlineButton(
                    label: "Follow",
                    onPressed: () {},
                    width: 100,
                    height: 40,
                  ),
                ],
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
            ],
          ),
        ],
      ),
    );
  }
}
