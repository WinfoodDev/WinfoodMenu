import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:winfood_menu/model/departamentos_model.dart';

import '../custom_dio.dart';
import '../model/produtos_model.dart';

class DeptoRepository{
  Future<List<DepartamentosModel>> getDeptosFuture() async {

    var _dio = CustomDio().getInstance();
    _dio.options
      ..baseUrl = "http://mobileapp.pediaki.com.br"
      ..connectTimeout = 60000
      ..receiveTimeout = 60000
      ..validateStatus = (int? status) {
        return status! > 0;
      };

    int codLoja = 1;

    log('Codloja /DEPARTAMENTOS: ' + codLoja.toString());

    Map<String, dynamic> param = {
      "codloja":codLoja,
    };

    Response response;
    List<DepartamentosModel> departamentos = [];

    try {
      response = await _dio.post("/api/departamentos", data: param);
      log('RESPONSE DEPARTAMENTOS:${response.statusCode}');
      departamentos = response.data.map<DepartamentosModel>((e) => DepartamentosModel.fromJson(e)).toList();
    } catch (error, stacktrace) {
      log('ERROR DEPARTAMENTOS:${error}');
      log('STACKTRACE DEPARTAMENTOS:${stacktrace}');
    }
    return departamentos;
  }
}