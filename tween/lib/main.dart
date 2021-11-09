import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(child: CurveAnimation()),
    ),
  ));
}

class CurveAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CurveAnimationState();
  }
}

class CurveAnimationState extends State<CurveAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
     late final Animation<double> _tween;


  void initState() {
    super.initState();
    _controller =
    AnimationController(duration: Duration(seconds: 3), vsync: this)
      ..repeat(); // or ..repear()
    _tween=Tween <double>(begin: 0,end: (2 * pi)).animate(_controller);

  }


  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation:_controller,
        builder: (_, __) {
          return Transform.rotate(
              angle: _controller.value ,
              child: FlutterLogo(
                size: 500,
              ));
        });
  }
}
