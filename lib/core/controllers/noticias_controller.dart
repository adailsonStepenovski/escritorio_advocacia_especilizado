import '../models/noticias_model.dart';
import '../references/references_firebase.dart'; // Importe seu modelo de notícia

class NoticiaService {


  Stream<List<Noticia>> getNoticias() {
    return noticiasCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Noticia.fromMap(doc.data());
      }).toList();
    });
  }

  Future<void> adicionarNoticia(Noticia noticia) {
    return noticiasCollection.add(noticia.toMap());
  }

  Future<void> editarNoticia(String id, Noticia noticia) {
    return noticiasCollection.doc(id).update(noticia.toMap());
  }

  Future<void> deletarNoticia(String id) {
    return noticiasCollection.doc(id).delete();
  }
}
