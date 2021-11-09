import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(

          CupertinoApp(title: "My App",
            home: CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(backgroundColor: Colors.lightBlueAccent,trailing: Icon(CupertinoIcons.info),
                  leading: Center(child:Text(
                      "Cupertino App"),),),
                  child:Center(child:Text("Cupertino Theme")



                )),




          ),








          );












}

