class Noticia {
  String? id;
  String tema;
  String titulo;
  String descricao;
  String foto;
  bool visivel;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  Noticia(
      {this.id,
      required this.tema,
      required this.titulo,
      required this.descricao,
      required this.foto,
      required this.visivel,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});

  @override
  String toString() {
    return 'Noticia{id: $id, tema: $tema, titulo: $titulo, descricao: $descricao, foto: $foto, visivel: $visivel, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt}';
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'foto': foto,'tema':tema,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
      'deleted_at': deletedAt?.millisecondsSinceEpoch,
      'visivel': visivel,
    };
  }

  factory Noticia.fromMap(dynamic map) {
    return Noticia(
      id: map['id'].toString(),
      titulo: map['titulo'].toString(),
      descricao: map['descricao'].toString(),
      foto: map['foto']!.toString(),tema:map['tema']!.toString() ,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
      deletedAt: map['deleted_at'] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(map['deleted_at']),
      visivel: map['visivel'],
    );
  }
}
