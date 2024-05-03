
import '../models/fale_conosco.dart';
import '../models/socios.dart';
import '../references/references_firebase.dart';

class FaleConoscoService {
  Stream<List<FaleConosco>> getFaleConosco() {
    return  faleConoscoCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return  FaleConosco.fromMap(doc.data());
      }).toList();
    });
  }


  Future<void> adicionarFaleConosco( FaleConosco faleConosco) {
    return faleConoscoCollection.add(faleConosco.toMap());
  }

  Future<void> editarFaleConosco(String id, Socios socio) {
    return faleConoscoCollection.doc(id).update(socio.toMap());
  }

  Future<void> deletarFaleConosco(String id) {
    return faleConoscoCollection.doc(id).delete();
  }
}
