import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import "current_index_provider.dart";

void main() {
  runApp(ChangeNotifierProvider<IndexProvider>(
      create: (_) => IndexProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(appBar: AppBar(title: Text("BottomNavigation Bar")),bottomNavigationBar:Buttomnavigation()));

    }


  }

  class Buttomnavigation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
      Consumer<IndexProvider>(
          builder:(context,IP,_){
      return BottomNavigationBar(currentIndex: IP.index,selectedItemColor: Colors.green,onTap: (int itemnumber){
        IP.set_index(itemnumber);


      },items: [
    BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.red,),label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.mail,color: Colors.red),label: "Mail"),
    BottomNavigationBarItem(icon: Icon(Icons.settings,color: Colors.red),label: "Setting"),
    BottomNavigationBarItem(icon: Icon(Icons.contacts,color: Colors.red),label: "Contact Us"),


    ],);


  });
  }

  }
