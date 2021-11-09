import 'package:flutter/material.dart';
import '../../localization/localization.dart';

class AppLocalizationDelegates extends LocalizationsDelegate
{
  const AppLocalizationDelegates();
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en','it','es'].contains(locale.languageCode);

  }

  @override
  Future load(Locale locale) {
    return
    AppLocalization.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) {
   return false;

  }

}