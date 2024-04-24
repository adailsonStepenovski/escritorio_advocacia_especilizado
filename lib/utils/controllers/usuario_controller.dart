import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/usuario.dart';
import '../references.dart';

class UserController extends BlocBase {
  final code = 'User Controller';
  StreamController<Usuario> usuarioController =
  StreamController<Usuario>.broadcast();
  Stream<Usuario> get outUsuario => usuarioController.stream;
  Sink<Usuario> get inUsuario => usuarioController.sink;

  Future<Usuario?> efetuarLogin(email, senha) {
    return auth
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((value) {
      return usuariosRef.doc(value.user?.uid).get().then((v) {
        if (v.data() != null) {
          localUser = Usuario.fromJson(v.data() as Map<String, dynamic>);
          inUsuario.add(localUser!);
          return localUser;
        } else {
          return null;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    usuarioController.close();
  }

  Future<void> registerUser(Usuario usuario) async {
    try {
      print('User $usuario');
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha!,
      );
      print('Userid');
      // Get the user ID
      String userId = userCredential.user!.uid;
      print('Userid $userId');
      // Create a document reference for the user in the 'usuarios' collection
      CollectionReference usuariosCollection = firestore.collection('usuarios');
      print('usuariosCollection $usuariosCollection');
      print('usuariosCollection ${usuariosCollection.id}');
      DocumentReference usuarioDocRef = usuariosCollection.doc(userId);

      // Set the user data in the document
      await usuarioDocRef.set(usuario.toJson());

      // Send email verification
      await userCredential.user!.sendEmailVerification();

      // Success message
      print('User registered successfully');

      // Show email verification message to the user
      print(
          'An email verification has been sent to ${userCredential.user!.email}. Please verify your email before logging in.');
    } catch (e) {
      // Error message
      print('Failed to register user: $e');
    }
  }

  bool logout() {
    auth.signOut();
    localUser = null;
    inUsuario.add(localUser!);
    return true;
  }

  Future<Usuario> updateUser(Usuario u) async {
    await usuariosRef.doc(u.id).set(u.toJson());
    localUser = u;
    inUsuario.add(localUser!);
    return localUser!;
  }

  Future<Usuario> getOrSetUser(UserCredential u, Usuario usuario) {
    usuario.id = u.user!.uid;

    return usuariosRef.doc(usuario.id).get().then((v) async {
      if (v.data() != null) {
        localUser = Usuario.fromJson(v.data() as Map<String, dynamic>);
        return localUser!;
      } else {
        usuariosRef.doc(usuario.id).set(usuario.toJson());
        localUser = usuario;
        inUsuario.add(localUser!);
        return localUser!;
      }
    });
  }
}

UserController userController = UserController();
Usuario? localUser;
FirebaseAuth auth = FirebaseAuth.instance;