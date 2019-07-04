import 'package:dio/dio.dart';
import 'package:playground_flutter/environment/environment.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Dio dio = new Dio()
  ..options.baseUrl = Environment.api
  ..options.connectTimeout = 5000
  ..options.receiveTimeout
  ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        var prefs = await SharedPreferences.getInstance();
        var token = prefs.getString(Environment.tokenKey);

        if (token != null) {
          options.headers.putIfAbsent('Authorization', () => token);
        }

        return options;
      },
    ),
  );

class WebClient {
  const WebClient();

  dynamic commonBehavior(Response response) {
    if (response.statusCode >= 400) {
      throw ('An error occurred: ' + response.data);
    }

    return response.data;
  }

  Future<dynamic> get(String uri, [data]) async {
    final Response response = await dio.get(uri, queryParameters: data);
    return commonBehavior(response);
  }

  Future<dynamic> post(String uri, dynamic data) async {
    try {
      final Response response = await dio.post(uri, data: data);
      return commonBehavior(response);
    } catch (e) {
      throw ('An error occurred');
    }
  }

  Future<dynamic> put(String uri, dynamic data) async {
    try {
      final Response response = await dio.put(uri, data: data);
      return commonBehavior(response);
    } catch (e) {
      throw ('An error occurred');
    }
  }

  Future<void> download(
      String url, savePath, ProgressCallback onProgress) async {
    try {
      await dio.download(url, savePath, onReceiveProgress: onProgress);
    } catch (e) {
      throw ('An error occurred');
    }
  }
}

final WebClient http = new WebClient();
