import 'package:coin_rich/utils/dio_client.dart';
import 'package:dio/dio.dart';

class Requests {
  static Future getData(String url) async {
    try {
      final response = DioClient.instance.dio.get(
        url,
      );
      return response;
    } on DioError catch (e) {
      throw Exception(e.response);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future postData(String url, data) async {
    try {
      final response = DioClient.instance.dio.post(
        url,
        data: data,
      );
      return response;
    } on DioError catch (e) {
      throw Exception(e.response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
