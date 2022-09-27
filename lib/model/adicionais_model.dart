class Adicionais {
  int? codigo;
  String? descricao;
  double? valor;
  int? produtoEstoque;
  double? qtdVinculoAoProduto;
  String? configFracao;
  // ""-pergunta se deseja aplicar a todas as partes da fração
  // 1- todas as partes
  // 2- somente na parte aplicada,
  // 3- somente na parte aplicada cobrando valor integral
  int? nivel;
  int? codGrupoObservac;
  int? quant = 0;

  Adicionais(
      {this.codigo,
        this.descricao,
        this.valor,
        this.produtoEstoque,
        this.qtdVinculoAoProduto,
        this.configFracao,
        this.nivel,
        this.codGrupoObservac,
        this.quant
      });

  Adicionais.fromJson(Map<String, dynamic> json) {
    codigo = json['Codigo'];
    descricao = json['Descricao'];
    valor = json['Valor'];
    produtoEstoque = json['produtoEstoque'];
    qtdVinculoAoProduto = json['qtdVinculoAoProduto'];
    configFracao = json['configFracao'];
    nivel = json['nivel'];
    codGrupoObservac = json['codGrupoObservac'];
    quant = json['quant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Codigo'] = this.codigo;
    data['Descricao'] = this.descricao;
    data['Valor'] = this.valor;
    data['produtoEstoque'] = this.produtoEstoque;
    data['qtdVinculoAoProduto'] = this.qtdVinculoAoProduto;
    data['configFracao'] = this.configFracao;
    data['nivel'] = this.nivel;
    data['codGrupoObservac'] = this.codGrupoObservac;
    data['quant'] = this.quant;
    return data;
  }

}