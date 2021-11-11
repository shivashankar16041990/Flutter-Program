import 'package:flutter/material.dart';
import 'package:restapi/http_client.dart';
import 'package:restapi/json_parser/json-parser.dart';
import 'package:restapi/todos.dart';

class FetchDataPage extends StatefulWidget {
  const FetchDataPage();

  @override
  State<StatefulWidget> createState() {
    return FetchDataPageState();
  }
}

class FetchDataPageState extends State<FetchDataPage> {
  late final Future<List<Todo>> todos;

  @override
  void initState() {
    super.initState();
    todos = RequestREST(endpoint: "/todos")
        .executeGet<List<Todo>>(const TodoParser());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
        future: todos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data ?? [];
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                      title: Text("${data[index].userId}"),
                      trailing: Text("${data[index].completed}"),
                      subtitle: Text(" ${data[index].title}"),
                      leading: Text(" ${data[index].id}"));
                });
          }

          if (snapshot.hasError) {
            return const Icon(Icons.warning);
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
