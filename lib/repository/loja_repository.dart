import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:winfood_menu/model/loja_model.dart';

import '../custom_dio.dart';

class LojaRepository{

  Future<Loja> getLojaFuture(String codLoja, HandlerErrorLoja handlerError) async {

    var _dio = CustomDio().getInstance();
    _dio.options
      ..baseUrl = "http://mobileapp.pediaki.com.br"
      ..connectTimeout = 60000
      ..receiveTimeout = 60000
      ..validateStatus = (int? status) {
        return status! > 0;
      };


    log('Codloja: ' + codLoja.toString());

    Map<String, dynamic> param = {
      "codloja":codLoja
    };

    Response response;
    Loja loja = Loja();

    try {
      response = await _dio.post("/api/retornaloja", data: param);
      log('RESPONSE CODLOJA:${codLoja} STATUSCODE:${response.statusCode}');
      log('RESPONSE CODLOJA:${codLoja} JSON:${response.data}');
      loja = Loja.fromJson(response.data);
    } catch (error, stacktrace) {
      handlerError.callbackErrorLoja(error.hashCode,error.toString());
      log('ERROR CODLOJA:${codLoja} ERROR:${error.hashCode}');
      log('STACKTRACE CODLOJA:${codLoja} STACK:${stacktrace}');
    }
    return loja;
  }

}

abstract class HandlerErrorLoja{
  void callbackErrorLoja(int statusCode, String statusMessage);
}