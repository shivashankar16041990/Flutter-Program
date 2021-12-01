import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import 'WidgetFaceProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<FaceProvider>(
      create: (_) => FaceProvider(),
      child: MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: Text("Face Detector"),
              ),
              body: MainPage()))));
}
