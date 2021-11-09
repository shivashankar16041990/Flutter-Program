import 'package:flutter/material.dart';
import 'package:myapp/routes/homepage.dart';
import 'package:myapp/routes/randompage.dart';

class RouteGenerator{

  static const String homepage='/';
  static const String randompage='/random';
  RouteGenerator._(){}


  static Route < dynamic> generateRoute(RouteSettings settings)
  {
      switch (settings.name)
      {
        case homepage:
          {
            return MaterialPageRoute(builder: (_)=> const  homePage());

          }
        case randompage:
          {
            return MaterialPageRoute(builder:(_)=>const randomPage());
          }
         default:
           {
             throw FormatException("Route not found");
           }
      }

  }


}

class RouteException implements Exception
{
  final String message ;
  const RouteException(this.message);

}