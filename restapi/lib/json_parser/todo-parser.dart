
import 'package:dio/dio.dart';
import 'json-parser.dart';
import 'object_parser.dart';
import 'post_parser.dart';
import 'package:restapi/todos.dart';



class TodoParser extends JsonParser<List<Todo>> with ListDecoder<List<Todo>> {
  const TodoParser();

  @override
  Future<List<Todo>> parseFromJson(String json) async {
    return decodeJsonList(json)
        .map((value) => Todo.fromJson(value as Map<String, dynamic>))
        .toList();
  }
}