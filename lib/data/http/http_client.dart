import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<List<dynamic>> get({required String url});
}

class MyHttpClient implements IHttpClient {
  final client = http.Client();

  @override
  Future<List<dynamic>> get({required String url}) async {
    final response = await client.get(Uri.parse(url));
    final body = jsonDecode(response.body);
    return body["data"];
  }
}

class DioClient implements IHttpClient {
  final client = Dio();

  @override
  Future<List<dynamic>> get({required String url}) async {
    final response = await client.get(url);
    final body = response.data;
    return body["data"];
  }
}
