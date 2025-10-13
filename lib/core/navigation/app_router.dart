// lib/core/navigation/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/app_logger.dart';
import './route_paths.dart';
import '../../features/screens.dart';
import '../../features/auth/presentation/states/auth_state.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

// Application router provider
final Provider<GoRouter> appRouterProvider = Provider<GoRouter>((Ref ref) {
  final AuthState authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: RoutePaths.initial,
    debugLogDiagnostics: true,
    redirect: (BuildContext context, GoRouterState state) {
      final bool isLoggedIn = authState.status == AuthStatus.authenticated;
      final bool isGoingToAuth =
          state.uri.toString() == RoutePaths.login ||
          state.uri.toString() == RoutePaths.signUp ||
          state.uri.toString() == RoutePaths.forgotPassword ||
          state.uri.toString().startsWith(RoutePaths.resetPassword);

      // If not logged in and not going to auth page, redirect to login
      if (!isLoggedIn && !isGoingToAuth) {
        return RoutePaths.login;
      }

      // If logged in and going to auth page, redirect to home
      if (isLoggedIn && isGoingToAuth) {
        AppLogger().i(
          "is logged in $isLoggedIn : is going to auth $isGoingToAuth",
        );
        // return '/';
      }

      return null;
    },
    routes: <RouteBase>[
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
        path: '${RoutePaths.resetPassword}/:code',
        builder: (BuildContext context, GoRouterState state) {
          final String code = state.pathParameters['code'] ?? '';
          return ResetPasswordScreen(code: code);
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
