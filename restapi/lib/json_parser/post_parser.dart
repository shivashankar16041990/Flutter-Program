import 'package:dio/dio.dart';
import 'json-parser.dart';
import 'object_parser.dart';
import 'post_parser.dart';
import 'package:restapi/post.dart';

class PostParser extends JsonParser<Post> with ObjectDecoder<Post> {
  const PostParser();

  @override
  Future<Post> parseFromJson(String json) async {
    final decoded = decodeJsonObject(json);
    return Post.fromJson(decoded);
  }
}