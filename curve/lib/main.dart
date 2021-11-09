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
  late final CurvedAnimation _curvedAnimation;
  late final ReverseAnimation _reverseAnimation;

  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 60), vsync: this)
          ..repeat(); // or ..repear()
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInQuad);
    _reverseAnimation = ReverseAnimation(_curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _reverseAnimation,
        builder: (_, __) {
          return Transform.rotate(
              angle: _controller.value * 2 * pi,
              child: FlutterLogo(
                size: 500,
              ));
        });
  }
}
