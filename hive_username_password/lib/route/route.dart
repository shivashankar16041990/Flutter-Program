import 'package:flutter/material.dart';
import 'package:hive_username_password/pages/pages.dart';

class RouteGenerator {
  static const homepage = '/';
  static const welcome_user = '/welcome user';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        {
          return MaterialPageRoute(builder: (_) => MyApp());
        }
      case welcome_user:
        {
          return MaterialPageRoute(
              builder: (_) => WelcomePage(user: settings.arguments as User));
        }
      default:
        {
          throw FormatException("Route not found");
        }
        ;
    }
  }
}

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
