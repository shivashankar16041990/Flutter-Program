import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Animation Builder"),
      ),
      body: Center(
        child: Rotate_Yaxis(),
      ),
    ),
  ));
}

class Rotate_Yaxis extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Rotate_Yaxis_State();
  }
}

class Rotate_Yaxis_State extends State<Rotate_Yaxis>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: Duration(seconds: 15))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          debugPrint("${ _controller.value}");

          return Transform(transform: Matrix4. skewY(0.5)
            ..rotateX(_controller.value * 2 * pi),

              child: child);
        },
        child:  Container(child:const Text("Animation",textScaleFactor: 3,),));
  }
}
