import 'package:flutter/material.dart';
import 'package:email_login_firebase/routepages/HomePage.dart';
import 'package:email_login_firebase/routepages/RegisterPage.dart';
import 'package:email_login_firebase/routepages/SignIn.dart';
import 'package:email_login_firebase/routepages/validatecode.dart';
import 'package:email_login_firebase/routepages/welcome user Page.dart';
class RouteGenerator {

  static const String homePage = '/';
  static const String registerPage  = '/registerPage';
  static const String signInPage  = '/signInPage';
  static const String validate  = '/validate';
  static const String welcomeUser  = '/WelcomeUser';
  static final key=GlobalKey<NavigatorState>();
  RouteGenerator._() {}

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case homePage:

        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case registerPage:{

        return MaterialPageRoute(
          builder: (_) =>const   RegisterPage(),
        );
      }

      case signInPage:{

        return MaterialPageRoute(
          builder: (_) => const SigninPage(),
        );
      }

      case validate:{

        return MaterialPageRoute(
          builder: (_) => const ValidationPage(),
        );
      }
      case welcomeUser:{

        return MaterialPageRoute(
          builder: (_) => const WelcomeUserPage(),
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