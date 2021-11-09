import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_intl/localization/applocalization_delegate.dart';
import 'package:localization_intl/localization/localization.dart';
import '../../localization/applocalization_delegate.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget
{
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(localizationsDelegates: [const AppLocalizationDelegates(),
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate]



    ,supportedLocales: const[Locale.fromSubtags(languageCode: 'en'),
        Locale.fromSubtags(languageCode: 'it'),
        Locale.fromSubtags(languageCode: 'es')


      ],




    home: Scaffold(body: Text(AppLocalization.of(context)?.helloWorld??'_'),),);
    
    
    
    
  }
  
  
}
