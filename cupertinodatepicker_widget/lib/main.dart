import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:provider/provider.dart';
import 'datetime_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<DateTimeProvider>(
      create: (_) => DateTimeProvider(),
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(title: Text("Cupertino Date Picker")),
        body: MyApp(),
      ))));
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        onPressed: () => _showPicker(context),
        child: Text("pick a date"),
      ),
      Text(context.watch<DateTimeProvider>().datetime.toString())
    ]);
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          final size = MediaQuery.of(context).size.height;
          final double panelheight = size == null ? 150 : size / 2.8;
          return SizedBox(
            height: panelheight,
            child: cupertino.CupertinoDatePicker(
              minimumYear: 1950,
              maximumYear: 2021,
              onDateTimeChanged: (selected) {
                debugPrint("${selected.toString()}");
                context.read<DateTimeProvider>().set_datetime(selected);
              },
              initialDateTime: DateTime.now(),
              mode: cupertino.CupertinoDatePickerMode.date,
              // mode: cupertino.CupertinoDatePickerMode.dateAndTime ,
              // mode: cupertino.CupertinoDatePickerMode.time ,
              //  mode: cupertino.CupertinoDatePickerMode.values ,
            ),
          );
        });
  }
}
