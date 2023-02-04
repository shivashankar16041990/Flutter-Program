import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CupertinoApp(localizationsDelegates: [
    DefaultMaterialLocalizations.delegate,
    DefaultCupertinoLocalizations.delegate,
    DefaultWidgetsLocalizations.delegate,
  ], home: MyApp()));
}

class MyApp extends StatelessWidget {
  late ValueNotifier<DateTime> selectedDateTime = ValueNotifier(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("cupertino date picker Sample"),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CupertinoButton(
              color: Colors.blue,
              child: const Text("pick date"),
              onPressed: () {
                _showPicker(context);
              }),
          ValueListenableBuilder(
            valueListenable: selectedDateTime,
            builder: (context, selectedDateTime, child) {
              return Text(
                selectedDateTime == null
                    ? "No date selected"
                    : selectedDateTime.toString(),
              );
            },
          )
        ],
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          final size = MediaQuery.of(context).size.height;
          final panelheight = size == null ? 150 : size / 2.8;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: panelheight as double,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  minimumYear: 1950,
                  maximumYear: 2100,
                  dateOrder: DatePickerDateOrder.ymd,
                  onDateTimeChanged: (dateTime) {
                    selectedDateTime.value = dateTime;
                    debugPrint("${dateTime.toString()}");
                  },
                ),
              ),
              CupertinoButton(
                  child: Text(
                    "ok",
                  ),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }
}
