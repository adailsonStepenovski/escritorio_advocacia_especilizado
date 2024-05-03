

class Evento {
  final String title;
  final String descricao;
  final DateTime? dataInicio;
  final DateTime? dataFinal;
  final  bool allDay;
  int? color;

  @override
  String toString() {
    return 'Evento{title: $title, descricao: $descricao, dataFinal: $dataFinal,dataInicio: $dataInicio, allDay: $allDay, color: $color}';
  }

  Evento(
      { this.dataInicio, required this.allDay,this.dataFinal,this.color,
        required this.title,
        required this.descricao,});

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "descricao": descricao,
      "dataInicio": dataInicio?.toIso8601String(), // Converte para string ISO
      "dataFinal": dataFinal?.toIso8601String(),
      "allDay": allDay,
      "color": color,
    };
  }


  factory Evento.fromMap(dynamic map) {
    return Evento(
      title: map["title"] as String,
      descricao: map["descricao"] as String,
      dataInicio: DateTime.parse(map["dataInicio"]) ,
      dataFinal: DateTime.parse(map["dataFinal"]) ,
      allDay: map["allDay"] as bool,
     color : int.parse(map["color"].toString()),
    );
  }
}

