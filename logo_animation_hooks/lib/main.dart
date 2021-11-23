import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(title: Text("flutter hook ")),
    body: MyApp(),
  )));
}

class MyApp extends HookWidget {
  const MyApp();

  static const R = 2 * 3.14;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final controller1 =
        useAnimationController(duration: const Duration(seconds: 1))..repeat();
    final controller2 =
        useAnimationController(duration: const Duration(seconds: 600))..repeat();

    return Center(child:Column(mainAxisAlignment:MainAxisAlignment.spaceAround,children: [
      AnimatedBuilder(
        animation: controller1,
        builder: (context, child) {
          return Transform.rotate(
            angle: controller1.value * R,
            child: child,
          );
        },
        child: FlutterLogo(size: 100),
      ),
      AnimatedBuilder(
        animation: controller1,
        builder: (context, child) {
          return Transform.rotate(
            angle: controller1.value * R,
            child: child,
          );
        },
        child: FlutterLogo(size: 100),
      )


    ]));
  }
}
