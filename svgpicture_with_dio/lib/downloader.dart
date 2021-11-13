import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Downloader {
  final String url;

  const Downloader({required this.url});

  static final _opt = BaseOptions(
    baseUrl: "https://fluttercompletereference.com/",
    connectTimeout: 300000,
    responseType: ResponseType.bytes,
  );
  static final _client = Dio(_opt);

  Future<List<int>> start() async {
    debugPrint(url);
    final request = await _client.get<List<int>>(url);
    return request.data!;
  }
}
