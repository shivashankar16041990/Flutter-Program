import 'package:flutter/material.dart';
import 'package:myapp/routes.dart';

void main()
{
  runApp(const RandomApp());
}

class RandomApp extends StatelessWidget
{
  const RandomApp();
  @override
  Widget build(BuildContext context) {
    return
        MaterialApp(
          onGenerateTitle: (_)=>"Random App",
          initialRoute: RouteGenerator.homepage,
          onGenerateRoute: RouteGenerator.generateRoute,
        );



  }



}