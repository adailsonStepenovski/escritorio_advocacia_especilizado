class Sobre {
   String? id;
   String titulo;
   String descricao;
   String subtitulo;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime deletedAt;

  @override
  String toString() {
    return 'Usuario{id: $id,titulo: $titulo, subtitulo:$subtitulo,descricao: $descricao,  created_at: $createdAt, updated_at: $updatedAt, deleted_at: $deletedAt}';
  }

  Sobre(
      {
         this.id,
        required this.titulo,
        required this.subtitulo,
        required this.descricao,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "descricao": descricao,
      "titulo": titulo,
      "subtitulo": subtitulo,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
      "deleted_at": deletedAt.toIso8601String(),
    };
  }

   factory Sobre.fromMap(dynamic map) {
     return Sobre(
       id: map["id"],
      descricao: map["descricao"],
       subtitulo: map["subtitulo"],
      titulo: map["titulo"],
      createdAt: DateTime.parse(map["created_at"]),
      updatedAt: DateTime.parse(map["updated_at"]),
      deletedAt: DateTime.parse(map["deleted_at"]),
    );
  }
//
}