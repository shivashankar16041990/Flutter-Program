library json_parser;

export 'post_parser.dart';
export 'todo-parser.dart';
export 'object_parser.dart';

abstract class JsonParser<T> {
  const JsonParser();

  Future<T> parseFromJson(String json);
}

