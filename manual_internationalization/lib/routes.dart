import 'package:flutter/material.dart';
import '../../Widgets/MyApp.dart';

class RouteGenerator {
  static const homepage = '/';


  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homepage:
        {
          return MaterialPageRoute(builder: (_) => const  MyApp());

        }

      default:
        {
          throw FormatException("Route not found");
        };
    }
  }
}

class RouteException implements Exception{
  final String message;
  const RouteException(this.message);

}
