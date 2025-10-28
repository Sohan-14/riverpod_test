import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../features/chat/presentation/screens/chat_screen.dart';
import '../../../features/home/presentation/screens/home_screen.dart';
import '../../../features/marketplace/presentation/screens/marketplace_screen.dart';
import '../../../features/post/presentation/screens/post_screen.dart';
import '../../../features/profile/presentation/screens/profile_screen.dart';
import '../../config/colors.dart';
import '../../config/icons.dart';
import '../provider/bottom_navigation_provider.dart';
import '../widgets/app_nav_bar.dart';

class BottomNavScreen extends ConsumerStatefulWidget {
  const BottomNavScreen({super.key});

  @override
  ConsumerState<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends ConsumerState<BottomNavScreen> {
  // PageController to control PageView
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    // Initialize PageController
    _pageController = PageController(
      initialPage: ref.read(selectedBottomTabProvider),
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when done
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Watch the selected tab index from the provider
    final int selectedIndex = ref.watch(selectedBottomTabProvider);

    // List of screens to display in the body
    final List<Widget> screens = <Widget>[
      const HomeScreen(),
      const MarketplaceScreen(),
      const PostScreen(),
      const ChatScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: PageView.builder(
        itemCount: screens.length,
        controller: _pageController,
        onPageChanged: (int index) {
          ref.read(selectedBottomTabProvider.notifier).setSelectedTab = index;
          ref.read(selectedBottomTabProvider.notifier).setPageIndex = index;
        },
        itemBuilder: (_, int index) {
          return screens[index];
        },
      ),
      bottomNavigationBar: SafeArea(
        child: AppNavBar(
          items: getNavItems(),
          selectedIndex: selectedIndex,
          onTabTapped: (int index) {
            ref.read(selectedBottomTabProvider.notifier).setSelectedTab = index;
            ref.read(selectedBottomTabProvider.notifier).setPageIndex = index;
            _pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }

  List<NavItem> getNavItems() {
    return <NavItem>[
      NavItem(
        iconPath: AppIcons.homeBottomNav,
        activeIconPath: AppIcons.homeBottomNav,
        label: "Home",
      ),
      NavItem(
        iconPath: AppIcons.marketplaceBottomNav,
        activeIconPath: AppIcons.marketplaceBottomNav,
        label: "MarketPlace",
      ),
      NavItem(
        iconPath: AppIcons.addBottomNav,
        activeIconPath: AppIcons.addBottomNav,
        label: "Post",
      ),
      NavItem(
        iconPath: AppIcons.chatBottomNav,
        activeIconPath: AppIcons.chatBottomNav,
        label: "Chat",
      ),
      NavItem(
        iconPath: AppIcons.profileBottomNav,
        activeIconPath: AppIcons.profileBottomNav,
        label: "Profile",
      ),
    ];
  }
}
