import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/localization_delegates.dart';

void main()
{
  runApp(
      MaterialApp(
    initialRoute: RouteGenerator.homepage,
    onGenerateRoute: RouteGenerator.generateRoute,
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,

      GlobalCupertinoLocalizations.delegate,

      GlobalWidgetsLocalizations.delegate,

      const AppLocalizationDelegates()

    ],


        supportedLocales: const[Locale.fromSubtags(languageCode: 'en'),
          Locale.fromSubtags(languageCode: 'it'),
          Locale.fromSubtags(languageCode: 'es'),






    ],));

}