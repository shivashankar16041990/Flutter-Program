import 'dart:math' as math;

import 'package:flutter/material.dart';

class RotatingLogo extends AnimatedWidget {
  final AnimationController _controller;

  const RotatingLogo({required AnimationController controller})
      : _controller = controller,
        super(listenable: controller);
  static const _fullrotation = 2 * math.pi;


  @override
  Widget build(BuildContext context) {
    debugPrint("_controller.value ${_controller.value}");
    debugPrint("_controller.lowerBound ${_controller.lowerBound}");
    debugPrint("_controller.upperBound ${_controller.upperBound}");
    debugPrint("_controller.animationBehavior ${_controller.animationBehavior.toString()}");
    debugPrint("static const _fullrotation $_fullrotation");
    return Transform.rotate(
      angle: _controller.value * _fullrotation,
      child: const FlutterLogo(
        size: 300,
      ),
    );
  }
}

class FLSpinner extends StatefulWidget {
  const FLSpinner();

  @override
  State<StatefulWidget> createState() {
    return FLSpinnerState();
  }
}

class FLSpinnerState extends State<FLSpinner> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return RotatingLogo(controller: _controller);
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(title: Text("Animation")),
    body: const Center(
      child: FLSpinner(),
    ),
  )));
}
