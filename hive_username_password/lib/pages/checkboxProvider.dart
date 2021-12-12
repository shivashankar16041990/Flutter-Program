import 'package:flutter/material.dart';
import "package:hive_flutter/hive_flutter.dart";

class CheckBoxWidgetwithHiveBox with ChangeNotifier {
  //for a check box
  bool check = false;

  //hive box objetc
  late Box<dynamic> box;

  //intinalization
  CheckBoxWidgetwithHiveBox() {
    box = Hive.box("setting");
  }

  //setting check value
  void setCheck(bool value) {
    check = value;
    notifyListeners();
  }

  //getting values from Hive
  List<String> getsetting() {
    return [box.get('name') as String, box.get('password') as String].toList();
  }

  //saving values
  void setsetting(String name, String password) {
    box.put("name", name);
    box.put("password", password);
  }

//checking wheather Hive box is empty or not
  bool issettingset() {
    if (!box.isEmpty)
      return true;
    else
      return false;
  }

  //clearing the box

  void clear() async {
    await box.clear();
  }
}
