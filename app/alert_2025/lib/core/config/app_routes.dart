class AppRoutes {
  static const String home = "/home";
  static const String login = "/login";
  static const String register = "/register";
  static const String profile = "/profile";
}

/**
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: AppRoutes.home, builder: (context, state) => HomeScreen()),
    GoRoute(path: AppRoutes.login, builder: (context, state) => LoginScreen()),
  ],
);
 */