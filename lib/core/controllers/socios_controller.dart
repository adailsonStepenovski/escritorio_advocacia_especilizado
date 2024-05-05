import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future<void> adicionarSocio(Socios socio) async {
    DocumentReference docRef = await sociosCollection.add(socio.toMap());
    editarSocios(docRef.id, socio);
  }

  Future<void> editarSocios(String id, Socios socio) {
    Socios sobreEdit = Socios(
        descricao: socio.descricao,
        foto: socio.foto,
        id: id,
        funcao: socio.funcao,
        nome: socio.nome,
        createdAt: socio.createdAt,
        telefone: socio.telefone,
        deletedAt: socio.deletedAt,
        updatedAt: socio.updatedAt);
    return sobreCollection.doc(id).update(sobreEdit.toMap());
  }

  Future<void> deletarSocio(String id) {
    return sociosCollection.doc(id).delete();
  }
}
