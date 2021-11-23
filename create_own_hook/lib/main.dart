import 'package:flutter/material.dart';
import "time_hook.dart";
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(title: Text("flutter hook ")),
    body: MyApp(),
  )));
}

class MyApp extends HookWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    int i = useRandomGenerator(100);
    return Column(children: [
      ElevatedButton(
        onPressed: () {
          debugPrint(i.toString());
        },
        child: Text("press the button"),
      ),
      Text(i.toString())
    ]);
  }
}
