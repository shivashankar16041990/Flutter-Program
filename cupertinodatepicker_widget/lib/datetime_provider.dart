import 'package:flutter/material.dart';

class DateTimeProvider with ChangeNotifier{
  var datetime=DateTime.now();

  void set_datetime(DateTime value){
    datetime=value;
    notifyListeners();
  }

}