import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:imdb_movies/constants/api_constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: '${ApiConstants.BASE_URL}',
          receiveDataWhenStatusError: true,
          headers: {
            'Content-Type':'application/json',
            'lang':"en",
          }

      ),
    );
  }

  static Future<Response> getData({
    @required String? url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    dio!.options.headers =
    {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization': token??'',
    };

    return await dio!.get(
      url!,
      queryParameters: query??null,
    );
  }

  static Future<Response> postData({

    @required String? url,
    Map<String, dynamic>? query,
    @required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async
  {
    dio!.options.headers =
    {
      'Content-Type':'application/json',
      'lang':lang,
    };

    return dio!.post(url!,data:data);
  }
}