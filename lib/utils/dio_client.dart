// coverage:ignore-file
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient {
  final _dio = Dio();
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  DioClient() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers["X-CMC_PRO_API_KEY"] =
            "27ab17d1-215f-49e5-9ca4-afd48810c149";
        return handler.next(options);
      },
      onResponse: (options, handler) {
        return handler.next(options);
      },
      onError: (e, handler) async {
        debugPrint(e.toString());
        return handler.next(e);
      },
    ));
  }
  Dio get dio => _dio;
}
