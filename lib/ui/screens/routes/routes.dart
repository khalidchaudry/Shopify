import 'package:flutter/material.dart';
import 'package:shopify/ui/screens/auth/login_screen.dart';
import 'package:shopify/ui/screens/auth/signup_screen.dart';

Map<String, Widget Function(BuildContext context)> routeName = {
  '/login': (context) => const LoginScreen(),
  '/signup': (context) => SignUpScreen(),
};
