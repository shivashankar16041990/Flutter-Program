import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Default Tab Controller"),
                bottom: const TabBar(
                  tabs: const [
                    Tab(icon: const Icon(Icons.home), text: "Home"),
                    Tab(icon: const Icon(Icons.settings), text: "Settings"),
                    Tab(icon: const Icon(Icons.share), text: "Share"),
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  const Text("view 1"),
                  const Text("View 2"),
                  const Text("View 3")
                ],
              ),
            )));
  }
}
