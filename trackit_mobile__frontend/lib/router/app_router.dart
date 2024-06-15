import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trackit_mobile__frontend/UI/Screens/HomeScreen.dart';
import 'package:trackit_mobile__frontend/UI/Screens/LazadaScreen.dart';
import 'package:trackit_mobile__frontend/UI/Screens/LoginScreen.dart';
import 'package:trackit_mobile__frontend/UI/Screens/MainScreen.dart';
import 'package:trackit_mobile__frontend/UI/Screens/ProfileScreen.dart';
import 'package:trackit_mobile__frontend/UI/Screens/ShopeeScreen.dart';
import 'package:trackit_mobile__frontend/UI/Screens/SignUp.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorLogin = GlobalKey<NavigatorState>(debugLabel: 'Login');
final _shellNavigatorHome = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _shellNavigatorShopee = GlobalKey<NavigatorState>(debugLabel: 'Shopee');
final _shellNavigatorLazada = GlobalKey<NavigatorState>(debugLabel: 'Lazada');
final _shellNavigatorProfile = GlobalKey<NavigatorState>(debugLabel: 'Profile');

final GoRouter _router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: "/",
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/signup",
      name: "signup",
      builder: (context, state) => const SignUpScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          navigationShell: navigationShell,
        );
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHome,
          routes: <RouteBase>[
            GoRoute(
              path: "/home",
              name: "home",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorShopee,
          routes: <RouteBase>[
            GoRoute(
              path: "/shopee",
              name: "shopee",
              builder: (context, state) => const ShopeeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorLazada,
          routes: <RouteBase>[
            GoRoute(
              path: "/lazada",
              name: "lazada",
              builder: (context, state) => const LazadaScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfile,
          routes: <RouteBase>[
            GoRoute(
              path: "/profile",
              name: "profile",
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

GoRouter get appRouter => _router;
