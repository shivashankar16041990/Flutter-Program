import 'package:flutter/material.dart';
import 'homePage.dart';
import 'fcm_Page.dart';
import 'Firebase_notification_model.dart';
class RouteGenerator {

  static const String homePage = '/';
  static const String fcm_Page  = 'fcm_Page';
static final key=GlobalKey<NavigatorState>();
  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case homePage:

    return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case fcm_Page:{

        return MaterialPageRoute(
          builder: (_) =>  Fcm_Page(settings.arguments as FirebaseNotification),
        );
      }

      default:
        throw FormatException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException( this.message);
}