class AreasAtuacao {
   String nome;
   String descricao;

  @override
  String toString() {
    return 'Usuario{nome: $nome, descricao: $descricao,}';
  }

  AreasAtuacao(
      {
        required this.nome,
        required this.descricao,});

  Map<String, dynamic> toMap() {
    return {
      "descricao": descricao,
      "nome": nome,
    };
  }

   factory AreasAtuacao.fromMap(dynamic map) {
     return AreasAtuacao(
      descricao: map["descricao"],
       nome: map["nome"],
    );
  }
//
}