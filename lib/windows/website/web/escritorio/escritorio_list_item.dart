
import 'package:flutter/material.dart';

import '../../../../core/models/socios.dart';

class EscritorioListItem extends StatelessWidget {
  final Socios socios;
  const EscritorioListItem( {required this.socios,super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.grey,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white, // Cor de fundo da imagem
                borderRadius: BorderRadius.circular(8.0),
                image:  DecorationImage(
                  image: NetworkImage(socios.foto,), // Substitua pelo caminho da sua imagem
                  fit: BoxFit.cover, // Ajuste a imagem para cobrir o container
                ),
              ),
            ),
            const SizedBox(width: 8), // Espaçamento entre a imagem e o conteúdo
             Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    socios.descricao,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8), // Espaçamento entre o título e a descrição
                  Text(
                    socios.descricao,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
