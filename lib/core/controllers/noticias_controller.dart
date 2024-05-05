import 'package:cloud_firestore/cloud_firestore.dart';

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

  Future<void> adicionarNoticia(Noticia noticia) async {
    DocumentReference docRef = await noticiasCollection.add(noticia.toMap());
    editarNoticia(docRef.id, noticia);
  }

  Future<void> editarNoticia(String id, Noticia noticia) {
    Noticia evento = Noticia(
        descricao: noticia.descricao,
        titulo: noticia.titulo,
        id: id,
        foto: noticia.foto,
        resumo: noticia.resumo,
        createdAt: noticia.createdAt,
        subtitulo: noticia.subtitulo,
        deletedAt: noticia.deletedAt,
        tema: noticia.tema,
        visivel: noticia.visivel,
        updatedAt: noticia.updatedAt);
    return eventosCollection.doc(id).update(evento.toMap());
  }


  Future<void> deletarNoticia(String id) {
    return noticiasCollection.doc(id).delete();
  }
}
