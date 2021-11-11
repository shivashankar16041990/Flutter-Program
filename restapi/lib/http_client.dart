import 'package:dio/dio.dart';
import 'json_parser/json-parser.dart';
import 'json_parser/object_parser.dart';
import 'json_parser/post_parser.dart';
import 'json_parser/todo-parser.dart';

class RequestREST {
  final String endpoint;
  final Map<String, String> data;
  const RequestREST({
    required this.endpoint,
    this.data = const {},
  });

  /// HTTP dio client
  static final _client = Dio(
      BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com/",
        connectTimeout: 3000, // 3 seconds
        receiveTimeout: 3000, // 3 seconds
        headers: <String, String>{"api-key": "add_one_if_needed", },
      )
  );

  Future<T> executeGet<T>(JsonParser<T> parser) async {
    final response = await _client.get<String>(endpoint);
    return parser.parseFromJson(response.data.toString());
  }

  Future<T> executePost<T>(JsonParser<T> parser) async {
    final formData = FormData.fromMap(data);
    final response = await _client.post<String>(
      endpoint,
      data: formData,
    );

    return parser.parseFromJson(response.data.toString());
  }
}