class Socios {
   String? id;
   String nome;
  String foto;
  String telefone;
   String descricao;
   String funcao;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;

  @override
  String toString() {
    return 'Usuario{id: $id,nome: $nome,foto: $foto,  telefone: $telefone, funcao:$funcao,descricao: $descricao,  created_at: $createdAt, updated_at: $updatedAt, deleted_at: $deletedAt}';
  }

  Socios(
      {
         this.id,
        required this.nome,
        required this.telefone,
        required this.funcao,
        required this.foto,
        required this.descricao,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "descricao": descricao,
      "nome": nome,
      "telefone": telefone,
      "funcao": funcao,
      "foto": foto,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
      "deleted_at": deletedAt.toIso8601String(),
    };
  }

   factory Socios.fromMap(dynamic map) {
     return Socios(
       id: map["id"],
      descricao: map["descricao"],
       funcao: map["funcao"],
      nome: map["nome"],
      telefone: map["telefone"],
      foto: map["foto"],
      createdAt: DateTime.parse(map["created_at"]),
      updatedAt: DateTime.parse(map["updated_at"]),
      deletedAt: DateTime.parse(map["deleted_at"]),
    );
  }
//
}