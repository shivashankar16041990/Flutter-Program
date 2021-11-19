import 'package:flutter/material.dart';
import 'mydrawer.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        home: Scaffold(
            drawer: const  Drawer(child:const  MyDrawer()),
            appBar:  AppBar(
              title:const Text("drawer"),
            ),
            body: const Center(
                child: const Text(
              "Drawer Widget",
              textScaleFactor: 5,
            ))));
  }
}
