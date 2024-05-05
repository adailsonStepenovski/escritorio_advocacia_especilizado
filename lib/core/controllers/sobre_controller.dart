


import 'package:cloud_firestore/cloud_firestore.dart';

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


  Future<void> adicionarSobre(Sobre sobre) async {
    DocumentReference docRef = await sobreCollection.add(sobre.toMap());
    editarSobre(docRef.id, sobre);
  }

  Future<void> editarSobre(String id, Sobre sobre) {
    Sobre sobreEdit = Sobre(
        descricao: sobre.descricao,
        titulo: sobre.titulo,
        id: id,
        createdAt: sobre.createdAt,
        subtitulo: sobre.subtitulo,
        deletedAt: sobre.deletedAt,
        updatedAt: sobre.updatedAt);
    return sobreCollection.doc(id).update(sobreEdit.toMap());

  }

  Future<void> deletarSobre(String id) {
    return sobreCollection.doc(id).delete();
  }
}
