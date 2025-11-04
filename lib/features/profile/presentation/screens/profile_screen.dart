import 'package:flutter/material.dart';
import '../../../../core/config/icons.dart';
import '../../../../core/config/colors.dart';
import '../../../../core/config/sizes.dart';
import '../tabs/friends_profile_tab.dart';
import '../tabs/gallery_profile_tab.dart';
import '../tabs/info_profile_tab.dart';
import '../tabs/post_profile_tab.dart';
import '../tabs/setting_profile_tab.dart';
import '../widgets/profile_card.dart';
import '../widgets/tab_item.dart';

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
    _tabController = TabController(length: 5, vsync: this);
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
                      TabItem(
                        selectedIndex: _selectedIndex,
                        label: "Setting",
                        index: 4,
                        icon: AppIcons.setting,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.md),

                if (_selectedIndex == 0) const InfoProfileTab(),
                if (_selectedIndex == 1) const PostProfileTab(),
                if (_selectedIndex == 2) const GalleryProfileTab(),
                if (_selectedIndex == 3) const FriendsProfileTab(),
                if (_selectedIndex == 4) const SettingProfileTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
