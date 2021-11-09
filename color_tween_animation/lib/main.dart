import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(child: tween_color()),
    ),
  ));
}

class tween_color extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return tween_colorState();
  }
}

class tween_colorState extends State<tween_color>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<int> _tween_color;


  void initState() {
    super.initState();
    _controller =
    AnimationController(duration: Duration(seconds: 9), vsync: this)
      ..reverse();
    _tween_color =
        IntTween (begin: 0, end: 100).animate(
            _controller);
  }


  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int i=0xff4caf50;
    return AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {debugPrint("${_tween_color.value}");
          return ElevatedButton( child: const Text("Animate me!"),
            style: ElevatedButton.styleFrom(primary:  Color(_tween_color.value),),//
            onPressed: (){
            if (_controller.status==AnimationStatus.dismissed) {
              _controller.forward();

           // debugPrint("if");
            }
            else
            {//debugPrint("else ${_controller.status}");
              _controller.reverse();
            }

           // Color(0xfff44336))" and "MaterialColor(primary value: Color(0xff4caf50))"

            },);
        },);
  }
}
