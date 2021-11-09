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
          final scale=(1-(_controller.value*0.5));
          final newPos=20+(_controller.value*400);
       // debugPrint("${ scale}");
          debugPrint("${ newPos}");

          //debugPrint("${ _controller.value}");

          return Stack(children: [Transform(transform: Matrix4. identity()..scale(scale)..translate(newPos,newPos),child:child)

              ,Text("Hello")]);
        },
        child: ElevatedButton(child: Text("move me"),onPressed: (){
          if(_controller.status==AnimationStatus.dismissed)
            {
              _controller.reverse();
            }
          else
            {
              _controller.forward();
            }




    },) );
  }
}
