


import '../models/sobre.dart';
import '../references/references_firebase.dart';

class SobreService {
  Stream<List<Sobre>> getSobre() {
    return sobreCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Sobre.fromMap(doc.data());
      }).toList();
    });
  }


  Future<void> adicionarSobre(Sobre sobre) {
    return sobreCollection.add(sobre.toMap());
  }

  Future<void> editarSocio(String id, Sobre sobre) {
    return sobreCollection.doc(id).update(sobre.toMap());
  }

  Future<void> deletarSobre(String id) {
    return sobreCollection.doc(id).delete();
  }
}
