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
    ],
    errorBuilder: (BuildContext context, GoRouterState state) =>
        const AppErrorScreen(),
  );
});

List<RouteBase> get onboardingRoutes {
  return <RouteBase>[
    GoRoute(
      path: RoutePaths.role,
      builder: (BuildContext context, GoRouterState state) =>
          const RoleScreen(),
    ),
  ];
}

List<RouteBase> get authRoutes {
  return <RouteBase>[
    GoRoute(
      path: RoutePaths.initial,
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
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
    GoRoute(
      path: RoutePaths.profile,
      builder: (BuildContext context, GoRouterState state) => const Scaffold(
        body: Center(
          child: Text("Profile"),
        ),
      ),
    ),
  ];
}
