import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'currentdatetime.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

void main() {
  runApp(StateNotifierProvider<CurrentDateTime,DateTime>(create: (_)=>CurrentDateTime(),child: MaterialApp(
      home:  Scaffold(
        appBar: AppBar(title:const Text("flutter hook ")),
        body: const MyApp(),
      ))));
}

class MyApp extends StatelessWidget {
const MyApp();

  @override
  Widget build(BuildContext context) {

    return Column(children: [
      ElevatedButton(child: const Text("Date and Time"),
        onPressed: () {
          context.read<CurrentDateTime>().refresh();
        }),
    Text(context.watch<DateTime>().toString())

    ]);
  }
}
