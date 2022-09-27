
class DepartamentosModel {
  int? codigo;
  String? nome;
  String? completa1Unidade;
  String? horarioDeVenda;
  String? imagem;

  DepartamentosModel(
      {
        this.codigo,
        this.nome,
        this.completa1Unidade,
        this.horarioDeVenda,
        this.imagem
      });

  DepartamentosModel.fromJson(Map<String, dynamic> json) {
    codigo = json['Codigo'];
    nome = json['Nome'];
    completa1Unidade = json['Completa1Unidade'];
    horarioDeVenda = json['HorarioDeVenda'];
    imagem = json['Imagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Codigo'] = this.codigo;
    data['Nome'] = this.nome;
    data['Completa1Unidade'] = this.completa1Unidade;
    data['HorarioDeVenda'] = this.horarioDeVenda;
    data['Imagem'] = this.imagem;
    return data;
  }
}
