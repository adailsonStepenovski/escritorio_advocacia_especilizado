import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/cliente.dart';
import '../references/references_firebase.dart';

class ClientesService {
  Stream<List<Cliente>> getCliente() {
    return clientesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        print(doc.data().toString());
        return Cliente.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<List<Cliente>> getClientes(String padrao) async {
    return Future<List<Cliente>>.delayed(
      Duration(milliseconds: 300), // Simulando um atraso de 300ms
      () {
        if (padrao.isNotEmpty) {
          return clientesCollection
              .where('nome', isGreaterThanOrEqualTo: padrao.toLowerCase())
              .where('nome', isLessThan: padrao.toLowerCase() + 'z')
              .get()
              .then((snapshot) {
            return snapshot.docs
                .map((doc) =>
                    Cliente.fromMap(doc.data() as Map<String, dynamic>))
                .toList();
          });
        } else {
          return clientesCollection.get().then((snapshot) {
            return snapshot.docs
                .map((doc) =>
                    Cliente.fromMap(doc.data() as Map<String, dynamic>))
                .toList();
          });
        }
      },
    );
  }

  Future<void> adicionarCliente(Cliente cliente) async {
    try {
      DocumentReference docRef = await clientesCollection.add(cliente.toMap());
      editarCliente(docRef.id, cliente);
    } catch (e) {
      print('Erro ao adicionar cliente no Firestore: $e');
    }
  }

  Future<void> editarCliente(String id, Cliente cliente) {
    Cliente c = Cliente(
        nome: cliente.nome,
        telefoneComercial: cliente.telefoneComercial,
        dataNascimento: cliente.dataNascimento,
        ctps: cliente.ctps,
        rg: cliente.rg,
        telefone: cliente.telefone,
        email: cliente.email,
        tituloEleitor: cliente.tituloEleitor,
        endereco: cliente.endereco,
        chavePix: cliente.chavePix,
        cnh: cliente.cnh,
        profissao: cliente.profissao,
        foto: cliente.foto,
        masculino: cliente.masculino,
        cpfCnpj: cliente.cpfCnpj,
        createdAt: cliente.createdAt,
        id: id);

    return clientesCollection.doc(id).update(cliente.toMap());
  }

  Future<void> deletarCliente(String id) {
    return clientesCollection.doc(id).delete();
  }
}
