import 'package:flutter/material.dart';
import 'route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'UserManagement.dart';
void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider<User>(create:(_)=>User(),child:MaterialApp(onGenerateTitle: (_) => "User Sign in",
    onGenerateRoute: RouteGenerator.generateRoute,navigatorKey: RouteGenerator.key,
    initialRoute: RouteGenerator.homePage,
    //debugShowCheckedModeBanner: false
  )));
}

