import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Langugeslikes.dart';
import 'firebase_initialization.dart';


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home:Scaffold(appBar:AppBar(title: Text("Firebase Langueges"),),body: LangugesLike ())));

}
