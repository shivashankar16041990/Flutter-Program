import "package:flutter/material.dart";
import "http Widget.dart";
import "request item class.dart";
import 'error widget.dart';
import 'dart:html';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const _url = "https://jsonplaceholder.typicode.com/posts/1";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Expolring http package")),
        body: const Center(
          child: HttpWidget(RequestItem(_url)),
        ),
      ),
    );
  }
}
