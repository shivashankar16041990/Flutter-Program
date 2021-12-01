import 'package:flutter/material.dart';

Widget fun(){
  return
  ListView.builder(
    //  itemExtent: 5,
      itemCount: 3,
      itemBuilder: (context,index){
    debugPrint("index is $index");



  return ListTile(isThreeLine:true,
    leading: Image.asset("asset/dart_picture.png", ),
    title: Text("java",textScaleFactor: 2,),
    subtitle: Text("Total likes 0",),
    trailing: IconButton(
      icon: Icon(Icons.thumb_up), onPressed: (){},),);});
}