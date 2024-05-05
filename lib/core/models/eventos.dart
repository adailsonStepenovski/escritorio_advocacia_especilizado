

import 'package:escritorio_advocacia_especilizado/core/models/cliente.dart';

class Evento {
  final String title;
  final String? id;
  final String descricao;
  final DateTime? dataInicio;
  final DateTime? dataFinal;
  final  bool allDay;
  final  Cliente? cliente;
  int? color;

  @override
  String toString() {
    return 'Evento{title: $title, descricao: $descricao, cliente: $cliente, dataFinal: $dataFinal,dataInicio: $dataInicio, allDay: $allDay, color: $color}';
  }

  Evento(
      {this.id,  this.dataInicio, this.cliente,  required this.allDay,this.dataFinal,this.color,
        required this.title,
        required this.descricao,});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "descricao": descricao,
      "cliente": cliente!.toMap(),
      "dataInicio": dataInicio?.toIso8601String(), // Converte para string ISO
      "dataFinal": dataFinal?.toIso8601String(),
      "allDay": allDay,
      "color": color,
    };
  }


  factory Evento.fromMap(dynamic map) {
    return Evento(
      id: map["id"] as String,
      title: map["title"] as String,
      descricao: map["descricao"] as String,
      dataInicio: DateTime.parse(map["dataInicio"]) ,
      dataFinal: DateTime.parse(map["dataFinal"]) ,
      cliente:map['cliente']==null?null: Cliente.fromMap(Map<String, dynamic>.from(map['cliente'])),
      allDay: map["allDay"] as bool,
     color : int.parse(map["color"].toString()),
    );
  }
}

