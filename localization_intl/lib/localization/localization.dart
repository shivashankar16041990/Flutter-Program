import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalization
{
  final Locale locale;
  const AppLocalization(this.locale);

  static AppLocalization?of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization);

  static Future <AppLocalization> load(Locale locale) async{
    final String localename=Intl.canonicalizedLocale(locale.languageCode);
    await initializeMessages(localename );
    Intl.defaultLocale=localename;
    return AppLocalization(locale);
  }

String get helloWorld =>Intl.message("Hello World",name: 'helloWorld');
  String get hello=>Intl.message('Hello',name:'hello');

}
