import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: PaginatedDataTable(
        rowsPerPage: 2,
        columns: [
          DataColumn(
            label: Text("Column No"),
            numeric: true,
          ),
          DataColumn(
            label: Text("Language"),
          ),
          DataColumn(
            label: Text("Created by"),
          ),
          DataColumn(
            label: Text("popularity"),
          ),
        ],
        source: PageTableSource(),
      ),
    );
  }
}

class PageTableSource extends DataTableSource {
  List<DataRow> rows = [
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
  ];

  @override
  DataRow? getRow(int index) {
    return rows[index];
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => 4;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
