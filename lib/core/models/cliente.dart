import 'package:escritorio_advocacia_especilizado/core/models/endereco.dart';

class Cliente {
  String? id;
  String nome;
  String profissao;
  String chavePix;
  String? telefoneComercial;
  String email;
  String foto;
  DateTime dataNascimento;
  Endereco endereco;
  String telefone;
  bool masculino;
  String cpfCnpj;
  String ctps;
  String cnh;
  String tituloEleitor;
  String rg;
  DateTime createdAt;

  @override
  String toString() {
    return 'Cliente{id: $id, nome: $nome, profissao: $profissao, '
        'chavePix: $chavePix, telefoneComercial: $telefoneComercial, '
        'email: $email, foto: $foto, dataNascimento: $dataNascimento, '
        'endereco: $endereco, telefone: $telefone, masculino: $masculino, '
        'cpfCnpj: $cpfCnpj, ctps: $ctps, cnh: $cnh, tituloEleitor: $tituloEleitor, '
        'rg: $rg, createdAt: $createdAt}';
  }

  Cliente(
      { this.id,
        required this.nome,
        required this.telefoneComercial,
        required this.dataNascimento,
        required this.ctps,
        required this.rg,
        required this.telefone,
        required this.email,
        required this.tituloEleitor,
        required this.endereco,
        required this.chavePix,
        required this.cnh,
        required this.profissao,
        required this.foto,
        required this.masculino,
        required this.cpfCnpj,
        required this.createdAt,});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'profissao': profissao,
      'chavePix': chavePix,
      'telefoneComercial': telefoneComercial,
      'email': email,
      'foto': foto,
      'dataNascimento': dataNascimento.toIso8601String(),
      'endereco': endereco.toMap(),
      'telefone': telefone,
      'masculino': masculino,
      'cpfCnpj': cpfCnpj,
      'ctps': ctps,
      'cnh': cnh,
      'tituloEleitor': tituloEleitor,
      'rg': rg,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Método para criar um objeto Pessoa a partir de um mapa
  static Cliente fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id'],
      nome: map['nome'],
      profissao: map['profissao'],
      chavePix: map['chavePix'],
      telefoneComercial: map['telefoneComercial'],
      email: map['email'],
      foto: map['foto'],
      dataNascimento: DateTime.parse(map['dataNascimento']),
      endereco: Endereco.fromMap(Map<String, dynamic>.from(map['endereco'])),
      telefone: map['telefone'],
      masculino: map['masculino'],
      cpfCnpj: map['cpfCnpj'],
      ctps: map['ctps'],
      cnh: map['cnh'],
      tituloEleitor: map['tituloEleitor'],
      rg: map['rg'],
      createdAt: DateTime.parse(map['createdAt']),
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