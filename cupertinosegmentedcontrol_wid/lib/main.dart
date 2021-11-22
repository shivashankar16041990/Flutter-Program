import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:provider/provider.dart';
import 'currentvalueprovider.dart';


void main() {
  runApp(
    ChangeNotifierProvider<CurrentValue>(create:(_)=>CurrentValue(),child:
      MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: Text("Segmented Control ")),
            body: MyApp(),
          ))));
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return cupertino.CupertinoSegmentedControl<int>(children: const <int,Widget>{
    0:Text("option 1"),
      1:Text("option 2"),
      2:Text("option 3"),
      3:Text("option 4"),
      4:Text("option 5"),
    },onValueChanged: (int value){context.read<CurrentValue>().set_currentvalue(value);},
      groupValue: context.watch<CurrentValue>().currentValue,
      selectedColor: Colors.greenAccent,
      unselectedColor: Colors.black,
      padding: EdgeInsets.all(50),






    );
  }
}
