
import 'combo.dart';

class ProdutosModel {

  int? codigo;
  String? nome;
  int? codDepto;
  double? precoVenda;
  double? precoPromocao;
  String? descricao;
  String? fracionamento;
  String? tipo;
  String? finalidade;
  double? valorMeio;
  String? modoPrecificacaoCombo;
  String? horaExibeInicial;
  String? horaExibeFinal;
  String? comissao;
  String? vinculo;
  List<Combo>? combo;
  String? imagem;
  String? completa1und;
  String? precoDaMaior;

  ProdutosModel(
      {this.codigo,
      this.nome,
      this.codDepto,
      this.precoVenda,
      this.precoPromocao,
      this.descricao,
      this.fracionamento,
      this.tipo,
      this.finalidade,
      this.valorMeio,
      this.modoPrecificacaoCombo,
      this.horaExibeInicial,
      this.horaExibeFinal,
      this.comissao,
      this.vinculo,
        this.combo,
      this.imagem,
      this.completa1und,
      this.precoDaMaior
      });

  ProdutosModel.fromJson(Map<String, dynamic> json) {
    codigo = json['Codigo'];
    nome = json['Nome'];
    codDepto = json['CodDepto'];
    precoVenda = json['PrecoVenda'];
    precoPromocao = json['PrecoPromocao'];
    descricao = json['Descricao'];
    fracionamento = json['Fracionamento'];
    tipo = json['Tipo'];
    finalidade = json['Finalidade'];
    valorMeio = json['ValorMeio'];
    modoPrecificacaoCombo = json['ModoPrecificacaoCombo'];
    horaExibeInicial = json['HoraExibeInicial'];
    horaExibeFinal = json['HoraExibeFinal'];
    comissao = json['Comissao'];
    vinculo = json['Vinculo'];
    if (json['Combo'] != null) {
      combo = <Combo>[];
      json['Combo'].forEach((v) {
        combo!.add(new Combo.fromJson(v));
      });
    }
    completa1und = json['Completa1und'];
    precoDaMaior = json['PrecoDaMaior'];
    imagem = json['Imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Codigo'] = this.codigo;
    data['Nome'] = this.nome;
    data['CodDepto'] = this.codDepto;
    data['PrecoVenda'] = this.precoVenda;
    data['PrecoPromocao'] = this.precoPromocao;
    data['Descricao'] = this.descricao;
    data['Fracionamento'] = this.fracionamento;
    data['Tipo'] = this.tipo;
    data['Finalidade'] = this.finalidade;
    data['ValorMeio'] = this.valorMeio;
    data['ModoPrecificacaoCombo'] = this.modoPrecificacaoCombo;
    data['HoraExibeInicial'] = this.horaExibeInicial;
    data['HoraExibeFinal'] = this.horaExibeFinal;
    data['Comissao'] = this.comissao;
    data['Vinculo'] = this.vinculo;
    if (this.combo != null) {
      data['Combo'] = this.combo!.map((v) => v.toJson()).toList();
    }
    data['Imagem'] = this.imagem;
    data['Completa1und'] = this.completa1und;
    data['PrecoDaMaior'] = this.precoDaMaior;
    return data;
  }

}
