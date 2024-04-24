import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference usuariosRef =
FirebaseFirestore.instance.collection('usuarios');