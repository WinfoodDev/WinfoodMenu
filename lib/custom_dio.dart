import 'package:dio/dio.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio();
  }

  Dio getInstance() {
    return _dio;
  }
}
