import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './route_paths.dart';
import '../../features/screens.dart';

// Application router provider
final Provider<GoRouter> appRouterProvider = Provider<GoRouter>((Ref ref) {
  return GoRouter(
    initialLocation: RoutePaths.initial,
    debugLogDiagnostics: true,
    // redirect: (BuildContext context, GoRouterState state) {
    //   final bool isLoggedIn = authState.status == AuthStatus.authenticated;
    //   final bool isGoingToAuth =
    //       state.uri.toString() == RoutePaths.login ||
    //       state.uri.toString() == RoutePaths.signUp ||
    //       state.uri.toString() == RoutePaths.forgotPassword ||
    //       state.uri.toString().startsWith(RoutePaths.resetPassword);

    //   // If not logged in and not going to auth page, redirect to login
    //   if (!isLoggedIn && !isGoingToAuth) {
    //     return RoutePaths.login;
    //   }

    //   // If logged in and going to auth page, redirect to home
    //   if (isLoggedIn && isGoingToAuth) {
    //     AppLogger().i(
    //       "is logged in $isLoggedIn : is going to auth $isGoingToAuth",
    //     );
    //     // return '/';
    //   }

    //   return null;
    // },
    routes: <RouteBase>[
      ...authRoutes,
      ...onboardingRoutes,
      ...generalRoutes,
      ...marketplaceRoutes,
      ...chatRoutes,
      ...profileRoutes,
      ...postRoutes,
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const AppErrorScreen(),
  );
});

List<RouteBase> get generalRoutes {
  return <RouteBase>[
    GoRoute(
      path: RoutePaths.bottomNav,
      builder: (BuildContext context, GoRouterState state) =>
          const BottomNavScreen(),
    ),
    GoRoute(
      path: RoutePaths.imageFullScreen,
      builder: (BuildContext context, GoRouterState state) {
        final Map<String, dynamic>? extraData =
            state.extra as Map<String, dynamic>?;
        final dynamic imagePath = extraData?['imagePath'] as dynamic;
        return FullScreenImageScreen(
          imagePath: imagePath,
        );
      },
    ),
  ];
}

List<RouteBase> get postRoutes {
  return <RouteBase>[
    GoRoute(
      path: RoutePaths.postStory,
      builder: (BuildContext context, GoRouterState state) =>
          const StoryPostScreen(),
    ),

    GoRoute(
      path: RoutePaths.postFeed,
      builder: (BuildContext context, GoRouterState state) =>
          const FeedPostScreen(),
    ),

    GoRoute(
      path: RoutePaths.createPostFeed,
      builder: (BuildContext context, GoRouterState state) =>
          const CreateFeedPostScreen(),
    ),

    GoRoute(
      path: RoutePaths.createProduct,
      builder: (BuildContext context, GoRouterState state) =>
          const CreateProductScreen(),
    ),

    GoRoute(
      path: RoutePaths.productOrders,
      builder: (BuildContext context, GoRouterState state) =>
          const ProductOrderScreen(),
    ),

    GoRoute(
      path: RoutePaths.sendDelivery,
      builder: (BuildContext context, GoRouterState state) =>
          const SendDeliveryScreen(),
    ),

    GoRoute(
      path: RoutePaths.assignedDriver,
      builder: (BuildContext context, GoRouterState state) =>
          const AssignedDriverScreen(),
    ),

    GoRoute(
      path: RoutePaths.report,
      builder: (BuildContext context, GoRouterState state) =>
          const ReportScreen(),
    ),
  ];
}

List<RouteBase> get profileRoutes {
  return <RouteBase>[
    GoRoute(
      path: RoutePaths.profile,
      builder: (BuildContext context, GoRouterState state) => const Scaffold(
        body: Center(
          child: Text("Profile"),
        ),
      ),
    ),

    GoRoute(
      path: RoutePaths.privacyPolicy,
      builder: (BuildContext context, GoRouterState state) =>
          const PrivacyPolicyScreen(),
    ),

    GoRoute(
      path: RoutePaths.termsCondition,
      builder: (BuildContext context, GoRouterState state) =>
          const TermsConditionScreen(),
    ),

    GoRoute(
      path: RoutePaths.contactUs,
      builder: (BuildContext context, GoRouterState state) =>
          const ContactUsScreen(),
    ),

    GoRoute(
      path: RoutePaths.ads,
      builder: (BuildContext context, GoRouterState state) => const AdsScreen(),
    ),

    GoRoute(
      path: RoutePaths.createAds,
      builder: (BuildContext context, GoRouterState state) =>
          const CreateAdsScreen(),
    ),
    GoRoute(
      path: RoutePaths.boostAds,
      builder: (BuildContext context, GoRouterState state) =>
          const BoostAdsScreen(),
    ),
  ];
}

List<RouteBase> get chatRoutes {
  return <RouteBase>[
    GoRoute(
      path: RoutePaths.oneToOneChat,
      builder: (BuildContext context, GoRouterState state) =>
          const OneToOneChatScreen(),
    ),
  ];
}

List<RouteBase> get marketplaceRoutes {
  return <RouteBase>[
    GoRoute(
      path: RoutePaths.localGems,
      builder: (BuildContext context, GoRouterState state) =>
          const LocalGemsScreen(),
    ),
    GoRoute(
      path: RoutePaths.storeDetails,
      builder: (BuildContext context, GoRouterState state) =>
          const StoreDetailsScreen(),
    ),
    GoRoute(
      path: RoutePaths.productDetails,
      builder: (BuildContext context, GoRouterState state) =>
          const ProductDetailsScreen(),
    ),
    GoRoute(
      path: RoutePaths.checkoutForm,
      builder: (BuildContext context, GoRouterState state) =>
          const CheckoutFormScreen(),
    ),
    GoRoute(
      path: RoutePaths.confirmOrder,
      builder: (BuildContext context, GoRouterState state) =>
          const OrderConfirmScreen(),
    ),
    GoRoute(
      path: RoutePaths.cart,
      builder: (BuildContext context, GoRouterState state) =>
          const CartScreen(),
    ),
    GoRoute(
      path: RoutePaths.order,
      builder: (BuildContext context, GoRouterState state) =>
          const OrderScreen(),
    ),
  ];
}

List<RouteBase> get onboardingRoutes {
  return <RouteBase>[
    GoRoute(
      path: RoutePaths.initial,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
    GoRoute(
      path: RoutePaths.onboarding,
      builder: (BuildContext context, GoRouterState state) =>
          const OnboardingScreen(),
    ),
    GoRoute(
      path: RoutePaths.role,
      builder: (BuildContext context, GoRouterState state) =>
          const RoleScreen(),
    ),
    GoRoute(
      path: RoutePaths.businessInfo,
      builder: (BuildContext context, GoRouterState state) =>
          const BusinessInfoScreen(),
    ),
    GoRoute(
      path: RoutePaths.vehicleInfo,
      builder: (BuildContext context, GoRouterState state) =>
          const VehicleInfoScreen(),
    ),
  ];
}

List<RouteBase> get authRoutes {
  return <RouteBase>[
    GoRoute(
      path: RoutePaths.login,
      builder: (BuildContext context, GoRouterState state) =>
          const LoginScreen(),
    ),
    GoRoute(
      path: RoutePaths.signUp,
      builder: (BuildContext context, GoRouterState state) =>
          const SignUpScreen(),
    ),
    GoRoute(
      path: RoutePaths.forgotPassword,
      builder: (BuildContext context, GoRouterState state) =>
          const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: RoutePaths.resetPassword,
      builder: (BuildContext context, GoRouterState state) {
        return const ResetPasswordScreen();
      },
    ),
    GoRoute(
      path: RoutePaths.changePassword,
      builder: (BuildContext context, GoRouterState state) {
        return const ChangePasswordScreen();
      },
    ),
    GoRoute(
      path: RoutePaths.verifyEmail,
      builder: (BuildContext context, GoRouterState state) {
        final Map<String, dynamic>? extraData =
            state.extra as Map<String, dynamic>?;
        final String type = extraData?['type'] as String? ?? 'forgot';
        return VerifyEmailScreen(
          type: type,
        );
      },
    ),
  ];
}
