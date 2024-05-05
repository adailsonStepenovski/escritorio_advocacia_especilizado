
import 'package:cloud_firestore/cloud_firestore.dart';

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


  Future<void> adicionarFaleConosco( FaleConosco faleConosco) async {
    DocumentReference docRef = await faleConoscoCollection.add(faleConosco.toMap());
    editarFaleConosco(docRef.id, faleConosco);
  }

  Future<void> editarFaleConosco(String id, FaleConosco faleConosco) {
    FaleConosco faleConoscoEdit = FaleConosco(
        nome: faleConosco.nome,
        email: faleConosco.email,
        id: id,
        telefone: faleConosco.telefone,
        createdAt: faleConosco.createdAt,
        mensagem: faleConosco.mensagem,);
    return faleConoscoCollection.doc(id).update(faleConoscoEdit.toMap());
  }



  Future<void> deletarFaleConosco(String id) {
    return faleConoscoCollection.doc(id).delete();
  }
}
