import 'package:datatable/sortbycolumnprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => SortbyColumnIndexProvider(),
    child: MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(),
        body: MyApp(),
      ),
    ),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _onSort(int index, bool value, BuildContext context) {
    debugPrint("index : $index  , value: $value");
    context.read<SortbyColumnIndexProvider>().SetSortColumnIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
            sortAscending: true,
            sortColumnIndex:
                context.watch<SortbyColumnIndexProvider>().SortIndex,
            columns: [
              DataColumn(
                  label: Text("Column No"),
                  numeric: true,
                  onSort: (index, value) => _onSort(index, value, context)),
              DataColumn(
                  label: Text("Language"),
                  onSort: (index, value) => _onSort(index, value, context)),
              DataColumn(
                  label: Text("Created by"),
                  onSort: (index, value) => _onSort(index, value, context)),
              DataColumn(
                  label: Text("popularity"),
                  onSort: (index, value) => _onSort(index, value, context)),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text("2")),
                DataCell(Text("C++")),
                DataCell(Text("Dennis Ritchie")),
                DataCell(Text("6.9 %")),
              ]),
              DataRow(cells: [
                DataCell(Text("1")),
                DataCell(Text("Python")),
                DataCell(Text("Guido van Rossum")),
                DataCell(Text("27.93 %")),
              ]),
              DataRow(cells: [
                DataCell(Text("4")),
                DataCell(Text("java")),
                DataCell(Text("Sun Microsystems")),
                DataCell(Text("16.78 %")),
              ]),
              DataRow(cells: [
                DataCell(Text("3")),
                DataCell(Text("C#")),
                DataCell(Text("Microsoft ")),
                DataCell(Text("6.99 %")),
              ])
            ]),
      ),
    );
  }
}
