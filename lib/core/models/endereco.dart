

// ignore: must_be_immutable
class Endereco  {
  int? id;
  String? endereco;
  String? cep;
  String? numero;
  String? pais;
  String? pontoReferencia;
  String? complemento;
  String? bairro;
  String? estado;
  String? cidade;

  @override
  String toString() {
    return 'Endereco{id: $id, endereco: $endereco, cep: $cep, numero: $numero,  pais: $pais, pontoReferencia: $pontoReferencia, complemento: $complemento, bairro: $bairro, estado: $estado, cidade: $cidade, }';
  }

  Endereco({
    this.id,
    this.endereco,
    this.cep,
    this.numero,
    this.complemento,
    this.bairro,
    this.estado,
    this.cidade,
    this.pontoReferencia,
    this.pais,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'endereco': endereco,
      'cep': cep,
      'numero': numero,
      'pais': pais,
      'pontoReferencia': pontoReferencia,
      'complemento': complemento,
      'bairro': bairro,
      'estado': estado,
      'cidade': cidade,
    };
  }

  // Método para criar um objeto Endereco a partir de um mapa
  static Endereco fromMap(Map<String, dynamic> map) {
    return Endereco(
      id: map['id'],
      endereco: map['endereco'],
      cep: map['cep'],
      numero: map['numero'],
      pais: map['pais'],
      pontoReferencia: map['pontoReferencia'],
      complemento: map['complemento'],
      bairro: map['bairro'],
      estado: map['estado'],
      cidade: map['cidade'],
    );
  }


}
