import 'package:dio/dio.dart';

import '../../../constant/api_constant.dart';

class DioFactory {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: ApiConstant.baseUrl, receiveDataWhenStatusError: true));
  }

  static Future<Response> getData(
      {required String url, required Map<String, dynamic> query}) {
    return dio.get(url, queryParameters: query);
  }
}
