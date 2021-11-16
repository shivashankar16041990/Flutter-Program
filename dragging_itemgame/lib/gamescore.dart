import 'package:flutter/material.dart';
import 'dart:math';

class GameScore with ChangeNotifier{

  var _score=0;
  var _currentValue=_random();

  int get score=>_score;
  int get currentValue=>_currentValue;
  static int _random(){
    return Random().nextInt(100);

  }

  void addPoints(int pts)
  {
    _score=_score+pts;
    _currentValue=_random();
    notifyListeners();
  }




}