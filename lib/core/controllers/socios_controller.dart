
import '../models/socios.dart';
import '../references/references_firebase.dart';

class SocioService {
  Stream<List<Socios>> getSocios() {
    return sociosCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Socios.fromMap(doc.data());
      }).toList();
    });
  }


  Future<void> adicionarSocio(Socios socio) {
    return sociosCollection.add(socio.toMap());
  }

  Future<void> editarSocio(String id, Socios socio) {
    return sociosCollection.doc(id).update(socio.toMap());
  }

  Future<void> deletarSocio(String id) {
    return sociosCollection.doc(id).delete();
  }
}
