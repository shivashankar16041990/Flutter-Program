import 'package:flutter/material.dart';
import 'FetchDataPage.dart';
void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Download Demo"),
            ),
            body: Center(
              child: const FetchDataPage(),
            )
        )
    );
  }
}