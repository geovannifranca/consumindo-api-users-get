import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});
}

class MyHttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future<dynamic> get({required String url}) async {
    final response = await client.get(Uri.parse(url));
    return jsonDecode(response.body).toList();
  }
}

class DioClient implements IHttpClient {
  final client = Dio();

  @override
  Future<dynamic> get({required String url}) async {
    final response = await client.get(url);
    return response.data;
  }
}
