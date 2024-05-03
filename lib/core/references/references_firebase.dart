import 'package:cloud_firestore/cloud_firestore.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference usuariosRef =
FirebaseFirestore.instance.collection('usuarios');
final CollectionReference noticiasCollection =
FirebaseFirestore.instance.collection('noticias');
final CollectionReference sociosCollection =
FirebaseFirestore.instance.collection('socios');
final CollectionReference sobreCollection =
FirebaseFirestore.instance.collection('sobre');
final CollectionReference areasAtuacaoCollection =
FirebaseFirestore.instance.collection('area_atuacao');
final CollectionReference faleConoscoCollection =
FirebaseFirestore.instance.collection('fale_conosco');
final CollectionReference eventosCollection =
FirebaseFirestore.instance.collection('eventos');