import 'package:escritorio_advocacia_especilizado/core/controllers/area_atuacao_controller.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_principal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/area_atuacao.dart';
import '../../../../utils/contantes.dart';
import 'area_atuacao_list_item.dart';


class AreaDeAtuacaoPage extends StatefulWidget {
  const AreaDeAtuacaoPage({super.key, });

  @override
  State<AreaDeAtuacaoPage> createState() => _AreaDeAtuacaoPageState();
}

class _AreaDeAtuacaoPageState extends State<AreaDeAtuacaoPage> {

 final AreasAtuacaoService _noticiaService = AreasAtuacaoService();
  @override
  Widget build(BuildContext context) {
    return   Column(children: [
      const ContainerPrincipal(label: 'Áreas de Atuação',),
      StreamBuilder<List<AreasAtuacao>>(
        stream: _noticiaService.getAreasAtuacao(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nenhuma notícia encontrada.'),
            );
          } else {
            return MediaQuery.of(context).size.width <= 1200
                ? Padding(
              padding: kIsWeb?const EdgeInsets.all(8.0):const EdgeInsets.only(left: 32.0,right: 32),
              child: ListView.builder(shrinkWrap: true,
                controller: ScrollController(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return AreasAtuacaoListItem(areasAtuacao: snapshot.data![index]);
                },),
            ):GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width <= 1700
                    ? 2

                    : 3,
                // Define 3 itens por linha

                crossAxisSpacing: 4.0,mainAxisExtent: height(context: context, size: .35),
                // Espaçamento horizontal entre os itens
                mainAxisSpacing: 4.0, // Espaçamento vertical entre os itens
              ),
              shrinkWrap: true,
              controller:ScrollController(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return AreasAtuacaoListItem(areasAtuacao: snapshot.data![index]);
              },
            );
          }
        },
      ),

    ],);}
}
