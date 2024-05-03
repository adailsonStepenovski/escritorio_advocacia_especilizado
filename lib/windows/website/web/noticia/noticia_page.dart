import 'package:escritorio_advocacia_especilizado/windows/website/web/noticia/noticia_list_item.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_principal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/controllers/noticias_controller.dart';
import '../../../../core/models/noticias_model.dart';
import '../../../../utils/contantes.dart';

class NoticiasPage extends StatefulWidget {
  const NoticiasPage({super.key});

  @override
  State<NoticiasPage> createState() => _NoticiasPageState();
}

class _NoticiasPageState extends State<NoticiasPage> {
  final NoticiaService _noticiaService=NoticiaService();
  ScrollController sc = ScrollController();
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      const ContainerPrincipal(label: 'Notícias',),

            StreamBuilder<List<Noticia>>(
              stream: _noticiaService.getNoticias(),
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
                  return  MediaQuery.of(context).size.width <= 1200
                      ? Padding(
                    padding: kIsWeb?const EdgeInsets.all(8.0):const EdgeInsets.only(left: 32.0,right: 32),
                    child: ListView.builder(shrinkWrap: true,
                      itemCount:  snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NoticiaListItem(noticia:  snapshot.data![index]);
                      },),
                  ):GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width <= 1700
                          ?3

                          :4,mainAxisExtent: height(context: context, size: .7),
                      // Define 3 itens por linha

                      crossAxisSpacing: 8.0,
                      // Espaçamento horizontal entre os itens
                      mainAxisSpacing: 8.0, // Espaçamento vertical entre os itens
                    ),
                    shrinkWrap: true,
                    controller: ScrollController(),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return NoticiaListItem(noticia: snapshot.data![index]);
                    },
                  );
                }
              },
            )

    ],);}
}
