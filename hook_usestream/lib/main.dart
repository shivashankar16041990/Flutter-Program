import 'dart:math';

import 'package:flutter/material.dart';
//import 'stream.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(title: Text("flutter hook ")),
    body: MyApp(),
  )));
}

class MyApp extends HookWidget {
  //const MyApp();
 final r=Random();

  @override
  Widget build(BuildContext context) {

    // final s=useStream<int>(streamobj.sendint(),initialData: 0);
    debugPrint("hi is printed");
    return StreamBuilder<int>(
      initialData: 0,
      stream: sendint(),
      builder: (context, snapshot) {
        return Text(snapshot.toString());
      },
    );
  }
  Stream<int> sendint()async*{
    while(true) {
      Future.delayed(Duration(seconds: 30));
      yield r.nextInt(100);
    }
}
