import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CupertinoApp(
    localizationsDelegates: [
      DefaultWidgetsLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
      DefaultMaterialLocalizations.delegate
    ],
    home: CupertinoPageScaffold(
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoSegmentedControl(
        onValueChanged: (int value) {},
        children: <int, Widget>{
          0: MyCard("male"),
          1: MyCard("female"),
          2: MyCard("do not wish to specify"),
        },
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  String text;
  MyCard(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(text),
    );
  }
}
