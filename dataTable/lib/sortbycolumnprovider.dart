import 'package:flutter/material.dart';

class SortbyColumnIndexProvider with ChangeNotifier {
  int _sortIndex = 0;
  int get SortIndex => _sortIndex;

  void SetSortColumnIndex(int index) {
    _sortIndex = index;
    notifyListeners();
  }
}
