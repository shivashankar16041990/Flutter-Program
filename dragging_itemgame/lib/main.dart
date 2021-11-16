import 'package:dragging_itemgame/gamescore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'gamescore.dart';
import 'evencontainer.dart';
import 'oddcontainer.dart';
import 'numbercontainer.dart';

void main() {
  runApp(ChangeNotifierProvider<GameScore>(
      create: (_) => GameScore(),
      child: const MaterialApp(home: const Scaffold(body: const MyApp()))));
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Consumer<GameScore>(
          builder: (context, gamescore, _) {
            return Center(
              child: Text("Score: ${gamescore.score} pts", textScaleFactor: 4,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,


                  decorationStyle: TextDecorationStyle.solid,
                ),


              ),


            );
          },
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const OddContainer(),
              const NumberContainer(),
              const EvenContainer()
            ])
      ],
    );
  }
}
