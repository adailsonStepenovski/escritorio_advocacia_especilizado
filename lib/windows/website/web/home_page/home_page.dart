
import '../../../../widgets/widgets/colors_customs.dart';
import '../../../../widgets/widgets/custom_text.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_principal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/controllers/noticias_controller.dart';
import '../../../../core/models/noticias_model.dart';
import '../../../../painel_page.dart';
import '../../../../utils/contantes.dart';
import '../noticia/noticia_list_item.dart';
import '../noticia/noticia_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NoticiaService _noticiaService = NoticiaService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ContainerPrincipal(
          label: 'Home Page',
        ),
        const SizedBox(height: 8), // Espaçamento entre a imagem e o conteúdo
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 24),
          child: SizedBox(
            width: height(context: context, size: 2),
            child: const TextBold(
              text: 'Informativo',
              fontSize: 56,
              fontColor: CustomColors.primary,
            ),
          ),
        ),
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
              List<Noticia> noticias = snapshot.data!.take(3).toList();
              return MediaQuery.of(context).size.width <= 1200
                  ? Padding(
                    padding: kIsWeb?const EdgeInsets.all(8.0):const EdgeInsets.only(left: 32.0,right: 32),
                    child: ListView.builder(shrinkWrap: true,
                    controller:ScrollController(),
                                    itemCount: noticias.length,
                                    itemBuilder: (context, index) {
                    return NoticiaListItem(noticia: noticias[index]);
                                    },),
                  ):GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width <= 1700
                      ? 3

                          : 4,
                  // Define 3 itens por linha

                  crossAxisSpacing: 8.0,mainAxisExtent: height(context: context, size: .7),
                  // Espaçamento horizontal entre os itens
                  mainAxisSpacing: 8.0, // Espaçamento vertical entre os itens
                ),
                shrinkWrap: true,
                controller:ScrollController(),
                itemCount: noticias.length,
                itemBuilder: (context, index) {
                  return NoticiaListItem(noticia: noticias[index]);
                },
              );
            }
          },
        ),
        SizedBox(
            width: height(context: context, size: 9),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PainelPage(
                            page: NoticiasPage(),
                          )),
                );
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'MAIS INFORMATIVO',
                  style: TextStyle(
                    fontSize: 18,
                    color: CustomColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            )),
      ],
    );
  }
}
