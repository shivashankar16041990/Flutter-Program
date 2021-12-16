import 'package:flutter/material.dart';

class LanguageModel with ChangeNotifier {
  var languages_code = ["en", "hi", "mr", "ar"];
  String _language = "en";

  String get choosen_language => _language;

  var language_name = ["English", "Hindi", "Marathi", "Arabic/urdu"];
  var sample = [
    "language",
    "brother",
    "English",
    "Hindi",
    "Marathi",
    "Arabic/urdu"
  ];

  void setLanguage(String selectedLanguage) {
    _language = selectedLanguage;
    notifyListeners();
    var my = languages_code.indexOf(choosen_language);
  }
}
