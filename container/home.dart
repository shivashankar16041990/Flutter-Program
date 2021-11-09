import 'package:flutter/material.dart';
class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return Center(
       child: Container(
              //margin: EdgeInsets.only(left: 20,top: 40),
              // width: 200,
              // height:200,
               alignment: Alignment.center,
               color: Colors.deepPurple,
                child:Text(
                  "Hello there",
                  textDirection:TextDirection.ltr,
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 24.0)
                  ,)
   ));
    throw UnimplementedError();
  }

}