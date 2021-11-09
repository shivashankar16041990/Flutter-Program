import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'localization.dart';

class AppLocalizationDelegates extends LocalizationsDelegate <AppLocalization>
{

  const AppLocalizationDelegates();
  @override
  bool isSupported(Locale locale) {


    return ['en','it','es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) {
   return
       SynchronousFuture <AppLocalization>(AppLocalization(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) {
    return false;
  }

}