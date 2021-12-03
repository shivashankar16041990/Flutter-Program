import 'package:flutter/material.dart';
import 'route.dart';
import 'fcm_setup.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 await FirebasePushManager.init();
  runApp(MaterialApp(onGenerateTitle: (_) => "Firebase Cloud messaging",
    onGenerateRoute: RouteGenerator.generateRoute,navigatorKey: RouteGenerator.key,
    initialRoute: RouteGenerator.homePage,
    //debugShowCheckedModeBanner: false
    ));
}

