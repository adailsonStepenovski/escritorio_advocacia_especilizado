class FaleConosco {
  String? id;
  String nome;
  String email;
  String telefone;
  String mensagem;
  DateTime createdAt;

  @override
  String toString() {
    return 'Usuario{id: $id, nome: $nome, email: $email,mensagem: $mensagem,  telefone: $telefone,  created_at: $createdAt, t}';
  }

  FaleConosco(
      { this.id,
        required this.nome,
        required this.telefone,
        required this.mensagem,
        required this.email,
        required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "telefone": telefone,
      "mensagem": mensagem,
      'email': email,
    };
  }

  factory FaleConosco.fromMap(dynamic map) {
    return FaleConosco(
      id: map["id"],
      nome: map["nome"],
      email: map['email'],
      mensagem: map['mensagem'],
      telefone: map["telefone"],
      createdAt: DateTime.parse(map["created_at"]),
    );
  }
//
}/*
 Usuario usuarioAdministrativo = Usuario(
                        id: '1',
                        nome: 'João Silva',
                        senha: 'senha123',
                        aob: 'Direito Tributário',
                        email: 'joao.silva@example.com',
                        foto: 'https://example.com/photo.jpg',
                        dataNascimento: DateTime(1985, 10, 15),
                        telefone: '(11) 98765-4321',
                        masculino: true,
                        cpfCnpj: '123.456.789-00',
                        notificacoes: true,
                        permissao: 10,
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                        deletedAt: DateTime.now(),
                      );

                      userController .registerUser(usuarioAdministrativo);*/