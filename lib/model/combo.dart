import 'itens_combo.dart';

class Combo {
  int? sequencia;
  String? descricao;
  int? qtdMin;
  int? qtdMax;
  int? codDepto;
  String? cobrarPrecoProduto;
  double? valorTotal;
  double? valorUnit;
  int? totalSelected;
  List<ItensCombo>? itensCombo;

  Combo(
      {this.sequencia,
        this.descricao,
        this.qtdMin,
        this.qtdMax,
        this.codDepto,
        this.cobrarPrecoProduto,
        this.valorTotal,
        this.valorUnit,
        this.itensCombo
      });

  Combo.fromJson(Map<String, dynamic> json) {
    sequencia = json['Sequencia'];
    descricao = json['Descricao'];
    qtdMin = json['QtdMin'];
    qtdMax = json['QtdMax'];
    codDepto = json['CodDepto'];
    cobrarPrecoProduto = json['CobrarPrecoProduto'];
    valorTotal = json['ValorTotal'];
    valorUnit = json['ValorUnit'];
    if (json['ItensCombo'] != null) {
      itensCombo = <ItensCombo>[];
      json['ItensCombo'].forEach((v) {
        itensCombo!.add(new ItensCombo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sequencia'] = this.sequencia;
    data['Descricao'] = this.descricao;
    data['QtdMin'] = this.qtdMin;
    data['QtdMax'] = this.qtdMax;
    data['CodDepto'] = this.codDepto;
    data['CobrarPrecoProduto'] = this.cobrarPrecoProduto;
    data['ValorTotal'] = this.valorTotal;
    data['valorUnit'] = this.valorUnit;
    if (this.itensCombo != null) {
      data['ItensCombo'] = this.itensCombo!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}