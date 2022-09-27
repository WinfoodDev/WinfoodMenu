
import 'adicionais_model.dart';

class ItensCombo {
  int? idOpcaoCombo;
  int? codProduto;
  String? nomeProduto;
  double? pVenda;
  double? valorUni;
  int? qtdSelected;
  List<Adicionais>? listObs;

  ItensCombo(
      {
        this.idOpcaoCombo,
        this.codProduto,
        this.nomeProduto,
        this.pVenda,
        this.valorUni,
        this.qtdSelected,
        this.listObs
      });

  ItensCombo.fromJson(Map<String, dynamic> json) {
    idOpcaoCombo = json['IdOpcaoCombo'];
    codProduto = json['CodProduto'];
    nomeProduto = json['NomeProduto'];
    pVenda = json['PVenda'];
    valorUni = json['ValorUni'];
    qtdSelected = json['QtdSelecionada'];
    if (json['ListObs'] != null) {
      listObs = <Adicionais>[];
      json['ListObs'].forEach((v) {
        listObs!.add(new Adicionais.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdOpcaoCombo'] = this.idOpcaoCombo;
    data['CodProduto'] = this.codProduto;
    data['NomeProduto'] = this.nomeProduto;
    data['PVenda'] = this.pVenda;
    data['ValorUni'] = this.valorUni;
    data['QtdSelecionada'] = this.qtdSelected;
    if (this.listObs != null) {
      data['ListObs'] = this.listObs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}