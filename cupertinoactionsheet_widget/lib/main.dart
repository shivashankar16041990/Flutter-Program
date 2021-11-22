import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;

void main() {
  runApp(
      MaterialApp(
          home: Scaffold(
        appBar: AppBar(title: Text("Cupertino Selectable options ")),
        body: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return cupertino.CupertinoButton(child: Text("select"), onPressed: (){ cupertino.showCupertinoModalPopup<void>(context: context,builder: (context)=>




    cupertino.CupertinoActionSheet(
        title: Text("select"),
        message: Text("selectable option"),
        actions: [
          cupertino.CupertinoActionSheetAction(
            child: Text("DoSomething"),
            isDefaultAction: true,
            onPressed: () => { Navigator.pop(context)},
          ),
          cupertino.CupertinoActionSheetAction(
              child: Text("Delete"),
              isDestructiveAction: true,
              onPressed: () => { Navigator.pop(context)}),
          cupertino.CupertinoActionSheetAction(
              child: Text("calcel"), onPressed: () => { Navigator.pop(context)})
        ],
        messageScrollController: ScrollController(),
        cancelButton: ElevatedButton(
          child: Text("Cancel"),
          onPressed: () => {},
        )));});
  }
}
