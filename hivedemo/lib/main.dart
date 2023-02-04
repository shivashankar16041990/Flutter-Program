import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'saveddate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  runApp(ChangeNotifierProvider(
      create: (_) {
        return SaveData()..init();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailidController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = context.watch<SaveData>().name;
    mailidController.text = context.watch<SaveData>().emailid;

    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintText: "Enter Your name",
                    enabledBorder: CustomOutlineBorder(),
                    focusedBorder: CustomFocusedBorder()),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: mailidController,
                decoration: InputDecoration(
                    hintText: "mail id",
                    enabledBorder: CustomOutlineBorder(),
                    focusedBorder: CustomFocusedBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<SaveData>()
                      .update(nameController.text, mailidController.text);
                },
                child: Text("save"))
          ],
        ),
      ),
    );
  }

  OutlineInputBorder CustomOutlineBorder() {
    return OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.greenAccent,
          width: 3,
        ));
  }

  OutlineInputBorder CustomFocusedBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 3,
        ));
  }
}
