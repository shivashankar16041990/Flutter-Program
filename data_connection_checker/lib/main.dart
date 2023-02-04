import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  Stream<InternetConnectionStatus> statusChange =
      InternetConnectionChecker().onStatusChange;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    widget.statusChange.listen((event) {
      ++counter;
      debugPrint("counter :$counter");
    });
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StreamBuilder<InternetConnectionStatus>(
              stream: widget.statusChange,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data;
                  if (data != null) {
                    debugPrint("data is not null");
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${data.name}"),
                          Text("Stream has send data $counter times")
                        ]);
                  }
                }
                return Text("no data");
              })
        ],
      ),
    );
  }
}
