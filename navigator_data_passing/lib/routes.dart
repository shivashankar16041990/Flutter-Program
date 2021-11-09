
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator_data_passing/widgets/homepage.dart';
import 'package:navigator_data_passing/widgets/todo class.dart';

import 'package:navigator_data_passing/widgets/details_of_list.dart';

class RouteGenerator
{
  static const String homepage ='/';
  static const String details_of_list='/details_of_list';
  RouteGenerator._() {}
  static Route < dynamic > generateRoute(RouteSettings settings)
  {
    switch(settings.name)
    {
      case homepage:
        {
          return MaterialPageRoute(builder: (_)=> HomePage());
        }

      default:
        {
          throw FormatException("Route not found");

        }
    }
    
    
    
  }




}
class RouteException  implements Exception{
final String message;
const RouteException(this.message);

}