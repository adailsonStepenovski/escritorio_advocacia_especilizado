class Usuario {
  String id;
  String nome;
  String? senha;
  String? aob;
  String email;
  String foto;
  DateTime dataNascimento;
  String telefone;
  bool masculino;
  String cpfCnpj;
  bool notificacoes;
  int permissao;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;

  @override
  String toString() {
    return 'Usuario{id: $id, nome: $nome,senha: $senha, email: $email, foto: $foto, aob: $aob, data_nascimento: $dataNascimento, telefone: $telefone, masculino: $masculino,  cpf_cnpj: $cpfCnpj,notificacoes: $notificacoes, permissao: $permissao, created_at: $createdAt, updated_at: $updatedAt, deleted_at: $deletedAt}';
  }

  Usuario(
      {required this.id,
        required this.nome,
        required this.senha,
        required this.dataNascimento,
        required this.telefone,
        required this.email,
        required this.foto,
        required this.aob,
        required this.masculino,
        required this.cpfCnpj,
        required this.notificacoes,
        required this.permissao,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nome": nome,
      "aob": aob,
      "data_nascimento": dataNascimento.toIso8601String(),
      "telefone": telefone,
      'email': email,
      "masculino": masculino,
      "cpf_cnpj": cpfCnpj,
      "notificacoes": notificacoes,
      "permissao": permissao,
      "foto": foto,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
      "deleted_at": deletedAt.toIso8601String(),
    };
  }

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json["id"],
      nome: json["nome"],
      aob: json["aob"],
      senha: json["senha"],
      email: json['email'],
      dataNascimento: DateTime.parse(json["data_nascimento"]),
      telefone: json["telefone"],
      masculino: json["masculino"],
      cpfCnpj: json["cpf_cnpj"],
      notificacoes: json["notificacoes"],
      foto: json["foto"],
      permissao: int.parse(json["permissao"].toString()),
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      deletedAt: DateTime.parse(json["deleted_at"]),
    );
  }
//
}