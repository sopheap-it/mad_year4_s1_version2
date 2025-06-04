import 'package:flutter/material.dart';
import 'package:mad_year4_s1_version2/screens/splash_screen.dart';
import 'package:mad_year4_s1_version2/screens/login_screen.dart';
import 'package:mad_year4_s1_version2/screens/register_screen.dart';
import 'package:mad_year4_s1_version2/screens/main_screen.dart';

class AppRoute {
  static const String splashScreen = "";
  static const String loginScreen = "loginScreen";
  static const String registerScreen = "registerScreen";
  static const String mainScreen = "mainScreen";

  static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return _buildRoute(routeSettings, const SplashScreen());
      case loginScreen:
        return _buildRoute(routeSettings, const LoginScreen());
      case registerScreen:
        return _buildRoute(routeSettings, const RegisterScreen());
      case mainScreen:
        return _buildRoute(routeSettings, const MainScreen());
      default:
        throw RouteException("Route not found!");
    }
  }

  static Route<dynamic> _buildRoute(
      RouteSettings routeSettings, Widget newScreen) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (BuildContext context) => newScreen,
    );
  }
}

class RouteException implements Exception {
  String message;

  RouteException(this.message);
}
