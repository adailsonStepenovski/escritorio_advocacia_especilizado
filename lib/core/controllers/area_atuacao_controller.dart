import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/area_atuacao.dart';
import '../references/references_firebase.dart';

class AreasAtuacaoService {
  Stream<List<AreasAtuacao>> getAreasAtuacao() {
    return areasAtuacaoCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return AreasAtuacao.fromMap(doc.data());
      }).toList();
    });
  }

  Future<void> adicionarAreaAtuacao(AreasAtuacao areaAtuacao) async {
    DocumentReference docRef =
        await areasAtuacaoCollection.add(areaAtuacao.toMap());
    editarAreaAtuacao(docRef.id, areaAtuacao);
  }

  Future<void> editarAreaAtuacao(String id, AreasAtuacao areaAtuacao) {
    AreasAtuacao area = AreasAtuacao(
        descricao: areaAtuacao.descricao, nome: areaAtuacao.nome, id: id);
    return areasAtuacaoCollection.doc(id).update(area.toMap());
  }

  Future<void> deletarAreaAtuacao(String id) {
    return areasAtuacaoCollection.doc(id).delete();
  }
}
