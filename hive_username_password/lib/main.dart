import 'package:flutter/material.dart';
import 'package:hive_username_password/route/route.dart';
import 'package:provider/provider.dart';
import 'package:hive_username_password/pages/pages.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  if (!Hive.isBoxOpen("setting")) {
    await Hive.openBox("setting");
  }
  //final box=Hive.box("setting");

  runApp(ChangeNotifierProvider(
      create: (_) => CheckBoxWidgetwithHiveBox(),
      child: MaterialApp(
        initialRoute: RouteGenerator.homepage,
        onGenerateRoute: RouteGenerator.generateRoute,
        onGenerateTitle: (context) => "hive",
      )));
}
