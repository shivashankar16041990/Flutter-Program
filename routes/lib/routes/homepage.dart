import 'package:flutter/material.dart';
import 'package:myapp/routes.dart';

class homePage extends StatelessWidget
{
  const homePage();
  @override
  Widget build(BuildContext context) {
   return
       Scaffold(body:
       Center(
         child: ElevatedButton(
           child: Text(
               "click on the button to see next page"),
           onPressed: (){
             Navigator.of(context).pushNamed(RouteGenerator.randompage);

       },),

       )


       );




  }

}
