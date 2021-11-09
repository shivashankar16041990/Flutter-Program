import 'package:flutter/material.dart';
import 'package:navigator_data_passing/routes.dart';

class Myapp extends StatelessWidget
{
  const Myapp();

  @override
  Widget build(BuildContext context) {

    return
        MaterialApp(
          onGenerateTitle:(_)=> 'Passing data with Navigator',
          initialRoute: RouteGenerator.homepage,
          onGenerateRoute: RouteGenerator.generateRoute,

        );


  }

}