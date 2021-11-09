import 'package:flutter/material.dart';

class AppLocalization
{
  final Locale locale;

  const AppLocalization(this.locale);
  static AppLocalization?of(BuildContext cxt) =>

      Localizations.of<AppLocalization>(cxt, AppLocalization);
 static Map <String ,Map<String,String>> _db= {
    'en': {
      'hello': 'Hello',
      'hello_world': 'Hello_World'
    },
    'it': {
      'hello': 'Ciao !',
      'hello_world': 'Ciao mendo'
    },
    'es': {
      'hello': 'Hola !',
      'hello_world': 'Hola mondo'
    }
  };



  }

  extension LocalizationExt on BuildContext{
  String localize(String value) {

    //find the  device's locale
    final code = AppLocalization
        .of(this)
        ?.locale
        .languageCode ?? 'en';
    final database = AppLocalization._db;
    if (database.containsKey(code))
  {
    return database[code]?[value]??'-';
  }
else
  {
    return database["en"]?[value]??"-";
  }

  }
  }

