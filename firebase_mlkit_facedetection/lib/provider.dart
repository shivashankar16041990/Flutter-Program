import 'package:flutter/material.dart';

class FaceProvider with ChangeNotifier {
  bool _showdetector = false;

  bool get isDetectorVisible => _showdetector;

  void setDetectorVisible(bool value) {
    _showdetector = value;
    notifyListeners();
  }
}
