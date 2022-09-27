class Loja {
  int? codloja;
  String? nome;
  String? imgLogo;
  String? imgFundo;

  Loja({this.codloja, this.nome, this.imgLogo, this.imgFundo});

  Loja.fromJson(Map<String, dynamic> json) {
    codloja = json['Codloja'];
    nome = json['Nome'];
    imgLogo = json['imgLogo'];
    imgFundo = json['imgFundo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Codloja'] = this.codloja;
    data['Nome'] = this.nome;
    data['imgLogo'] = this.imgLogo;
    data['imgFundo'] = this.imgFundo;
    return data;
  }
}