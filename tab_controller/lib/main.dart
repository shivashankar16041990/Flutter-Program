import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _Page());
  }
}

class _Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<_Page> with SingleTickerProviderStateMixin {
  late final TabController tabcontroller;

  void initState() {
    super.initState();
    tabcontroller = TabController(length: 3, vsync: this);
  }

  void dispose() {
    tabcontroller.dispose();
    super.dispose();
  }

  void _changePage(int index) {
    if (index >= 0) {
      tabcontroller.animateTo(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Tab Controller"),
          bottom: TabBar(
            controller: tabcontroller,
            tabs: const [
              Tab(icon: const Icon(Icons.home), text: "Home"),
              Tab(icon: const Icon(Icons.settings), text: "Settings"),
              Tab(icon: const Icon(Icons.share), text: "Share"),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabcontroller,
          children: [
            const Text("View 1"),
            const Text("View 2"),
            const Text("View 3")
          ],
        ));
  }
}
