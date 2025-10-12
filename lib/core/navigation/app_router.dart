// lib/core/navigation/app_router.dart
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
    //   AppLogger().d('Navigating to: ${state.uri.path}');

    //   // Check if the user is authenticated
    //   final isAuthenticated = authState.maybeWhen(
    //     authenticated: (_) => true,
    //     orElse: () => false,
    //   );

    //   // Define authenticated and unauthenticated paths
    //   final bool isAuthenticatedPath =
    //       state.uri.path.startsWith(RoutePaths.home) ||
    //       state.uri.path.startsWith(RoutePaths.profile) ||
    //       state.uri.path.startsWith(RoutePaths.settings);

    //   final bool isUnauthenticatedPath =
    //       state.uri.path == RoutePaths.signIn ||
    //       state.uri.path == RoutePaths.signUp ||
    //       state.uri.path == RoutePaths.forgotPassword ||
    //       state.uri.path.startsWith(RoutePaths.resetPassword);

    //   // Redirect logic
    //   if (!isAuthenticated && isAuthenticatedPath) {
    //     AppLogger().i('Redirecting to signIn (not authenticated)');
    //     return RoutePaths.signIn;
    //   } else if (isAuthenticated && isUnauthenticatedPath) {
    //     AppLogger().i('Redirecting to home (already authenticated)');
    //     return RoutePaths.home;
    //   }

    //   // No redirect needed
    //   return null;
    // },
    routes: <RouteBase>[
       GoRoute(
        path: RoutePaths.initial,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      // GoRoute(
      //   path: RoutePaths.signIn,
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const SignInScreen(),
      // ),
      // GoRoute(
      //   path: RoutePaths.signUp,
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const SignUpScreen(),
      // ),
      // GoRoute(
      //   path: RoutePaths.forgotPassword,
      //   builder: (BuildContext context, GoRouterState state) =>
      //       const ForgotPasswordScreen(),
      // ),
      // GoRoute(
      //   path: RoutePaths.resetPassword,
      //   builder: (BuildContext context, GoRouterState state) {
      //     final String? token = state.uri.queryParameters['token'];
      //     return ResetPasswordScreen(token: token);
      //   },
      // ),
      // Home screen route (placeholder)
    ],
    errorBuilder: (BuildContext context, GoRouterState state) => Scaffold(
      body: Scaffold(
        body: SafeArea(
          child: Center(
            child: Text('Error: ${state.error}'),
          ),
        ),
      ),
    ),
  );
});
