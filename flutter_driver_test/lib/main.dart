import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  int count = 0;

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Row(
        children: [
          ElevatedButton(key: Key("increment"),
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: Text("+")),
          Text("$count",key: Key("counter")),
          ElevatedButton(key: Key("decrement"),
              onPressed: () {
                setState(() {
                  count--;
                });
              },
              child: Text("-"))
        ],
      ),
    ));
  }
}
