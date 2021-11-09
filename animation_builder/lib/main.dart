import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Animation Builder"),
      ),
      body: Center(
        child: Animation_Builder(),
      ),
    ),
  ));
}

class Animation_Builder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Animation_Builder_State();
  }
}

class Animation_Builder_State extends State<Animation_Builder>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 10))
          ..repeat(reverse: true);
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
      builder: (_, __) {
        debugPrint("${ _controller.value}");

        return Transform.rotate(
            angle: _controller.value * 2 * pi,
            child: const FlutterLogo(size:300));
      },
    );
  }
}
