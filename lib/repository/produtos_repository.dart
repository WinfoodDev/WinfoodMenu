import 'package:dio/dio.dart';
import 'dart:developer';
import '../custom_dio.dart';
import '../global_baseurl_nuvem.dart';
import '../model/produtos_model.dart';


class ProdutosRepository {

  Future<List<ProdutosModel>> getProdutosFuture(String tipo, String codLoja) async {

    var _dio = CustomDio().getInstance();
    _dio.options
      ..baseUrl = "http://mobileapp.pediaki.com.br"
      ..connectTimeout = 60000
      ..receiveTimeout = 60000
      ..validateStatus = (int? status) {
        return status! > 0;
      };


    log('REQUEST: PRODUTOS ${tipo.toUpperCase()}');
    log('Codloja /Produtos: ' + codLoja.toString());
    log('Tipo /Produtos: ' + tipo);

    Map<String, dynamic> param = {
      "codloja":codLoja,
      "tipo": tipo,
    };

    Response response;
    List<ProdutosModel> produtos = [];

    try {
      response = await _dio.post("/api/produtos", data: param);
      log('RESPONSE  ${tipo.toUpperCase()}:${response.statusCode}');
      produtos = response.data.map<ProdutosModel>((e) => ProdutosModel.fromJson(e)).toList();
    } catch (error, stacktrace) {
      log('ERROR ${tipo.toUpperCase()}:${error}');
      log('STACKTRACE ${tipo.toUpperCase()}:${stacktrace}');
    }
    return produtos;
  }
}
