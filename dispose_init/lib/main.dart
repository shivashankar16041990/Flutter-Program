import 'package:dispose_init/pushpage.dart';
import 'package:dispose_init/pushreplacement.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: const MyApp(),
      theme: ThemeData(
          // primaryColor: Colors.red,
          primarySwatch: Colors.blueGrey,
          brightness: Brightness.dark),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    print("init from MyAppState is called");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("init and dispose"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("push Page"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const PushPage()));
              },
            ),
            ElevatedButton(
              child: Text("Page Replacement"),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => const PushPageReplacement()));
              },
            ),
          ],
        ),
      ),
    );
  }

  void dispose() {
    print("dispose from MyAppState is called");

    super.dispose();
  }

  void DisplaySnack(BuildContext context, {required String msg}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
        ),
      ),
    );
  }
}
