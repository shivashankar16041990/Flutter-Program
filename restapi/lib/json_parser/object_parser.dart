import 'package:dio/dio.dart';
import 'json-parser.dart';
import 'object_parser.dart';
import 'post_parser.dart';
import 'package:restapi/todos.dart';

import 'dart:convert';

mixin ObjectDecoder<T> on JsonParser<T> {
  Map<String, dynamic> decodeJsonObject(String json) =>
      jsonDecode(json) as Map<String, dynamic>;
}

mixin ListDecoder<T> on JsonParser<T> {
  List<dynamic> decodeJsonList(String json) =>
      jsonDecode(json) as List<dynamic>;
}

