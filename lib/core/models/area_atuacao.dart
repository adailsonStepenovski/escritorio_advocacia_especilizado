class AreasAtuacao {
   String nome;
   String? id;
   String descricao;

  @override
  String toString() {
    return 'Usuario{nome: $nome, id: $id, descricao: $descricao,}';
  }

  AreasAtuacao(
      {
        required this.nome,
         this.id,
        required this.descricao,});

  Map<String, dynamic> toMap() {
    return {
      "descricao": descricao,
      "nome": nome,
      "id": id,
    };
  }

   factory AreasAtuacao.fromMap(dynamic map) {
     return AreasAtuacao(
      descricao: map["descricao"],
       nome: map["nome"],
       id: map["id"],
    );
  }
//
}