import 'package:flutter/material.dart';
import 'sourcelist.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home:  Scaffold(
            body: ChangeNotifierProvider<SourceList>(
      create: (_) => SourceList(),
      child: const  SwipeItem(),
    )));
  }
}

class SwipeItem extends StatelessWidget {
  const SwipeItem();
  @override
  Widget build(BuildContext context) {
    return Consumer<SourceList>(
      builder: (context, sourcelist, _) {
        return ListView.builder(
            itemCount: sourcelist.values.length,
            itemBuilder: (context, index) {
              var item = sourcelist.values[index];

              return Dismissible(
                key:  Key(item),
                child: ListTile(
                  leading:const  Icon(Icons.trending_flat),
                  title:   Text(item),
                ),
                background:  Container(
                  color: Colors.redAccent,
                ),
                onDismissed: (_) => sourcelist.removeItem(index),
                direction:  DismissDirection.startToEnd,
                confirmDismiss: (direction) => _getConfirm(context, direction),
              );
            });
      },
    );
  }

  Future<bool?> _getConfirm(BuildContext context, DismissDirection direction) {
    return  showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:const  Text("Confirm Deletion"),
            content: const Text("Do you really want to delete"),
            actions:<Widget> [
              ElevatedButton(
                  onPressed: ()=>Navigator.of(context)?.pop(true),
                  child: const Text("yes")),
              ElevatedButton(
                  onPressed:()=> Navigator.of(context)?.pop(false),
                  child: const Text("no"))
            ],
          );
        });
  }
}
