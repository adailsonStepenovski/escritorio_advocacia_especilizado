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

  Future<void> adicionarAreaAtuacao(AreasAtuacao areaAtuacao) {
    return areasAtuacaoCollection.add(areaAtuacao.toMap());
  }

  Future<void> editarAreaAtuacao(String id, AreasAtuacao areaAtuacao) {
    return areasAtuacaoCollection.doc(id).update(areaAtuacao.toMap());
  }

  Future<void> deletarAreaAtuacao(String id) {
    return areasAtuacaoCollection.doc(id).delete();
  }
}
