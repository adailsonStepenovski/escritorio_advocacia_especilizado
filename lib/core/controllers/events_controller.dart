import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/eventos.dart';
import '../references/references_firebase.dart';

class EventsService {
  Stream<List<Evento>> getEventos() {
    return eventosCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        print(doc.data().toString());
        return Evento.fromMap(doc.data());
      }).toList();
    });
  }

  Future<void> adicionarEvento(Evento evento) async {
    DocumentReference docRef = await eventosCollection.add(evento.toMap());
    editarEvento(docRef.id, evento);
  }

  Future<void> editarEvento(String id, Evento areaAtuacao) {
    Evento evento = Evento(
        descricao: areaAtuacao.descricao,
        title: areaAtuacao.title,
        id: id,
        allDay: areaAtuacao.allDay,
        color: areaAtuacao.color,
        cliente: areaAtuacao.cliente,
        dataFinal: areaAtuacao.dataFinal,
        dataInicio: areaAtuacao.dataInicio);
    print('aqui retornou ${evento.toString()}');
    return eventosCollection.doc(id).update(evento.toMap());
  }

  Future<void> deletarEvento(String id) {
    print('aqui id:$id');
    return eventosCollection.doc(id).delete();
  }
}
