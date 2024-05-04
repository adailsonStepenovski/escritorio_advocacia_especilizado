

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

  Future<void> adicionarEvento(Evento evento) {
    return eventosCollection.add(evento.toMap());
  }

  Future<void> editarEvento(String id, Evento evento) {
    return eventosCollection.doc(id).update(evento.toMap());
  }

  Future<void> deletarEvento(String id) {
    return eventosCollection.doc(id).delete();
  }
}
