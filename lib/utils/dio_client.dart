import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient {
  static DioClient? _instance;
  late Dio _dio;
  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();
  static DioClient get instance {
    _instance ??= DioClient._();
    return _instance!;
  }

  DioClient._() {
    _dio = Dio();
    _dio.interceptors.add(
      InterceptorsWrapper(
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
      ),
    );
  }

  Dio get dio => _dio;
}
