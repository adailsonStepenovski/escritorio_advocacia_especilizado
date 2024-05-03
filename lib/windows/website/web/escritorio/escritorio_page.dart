import 'package:escritorio_advocacia_especilizado/core/controllers/socios_controller.dart';
import 'package:escritorio_advocacia_especilizado/windows/website/widgets/container_principal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../core/controllers/sobre_controller.dart';
import '../../../../core/models/sobre.dart';
import '../../../../core/models/socios.dart';
import '../../../../utils/contantes.dart';
import 'sobre_list_item.dart';
import 'socio_list_item.dart';


class EscritorioPage extends StatefulWidget {
  const EscritorioPage({super.key, });

  @override
  State<EscritorioPage> createState() => _EscritorioPageState();
}

class _EscritorioPageState extends State<EscritorioPage> {
final SocioService _socioService=SocioService();
  final SobreService _sobreService=SobreService();
  @override
  Widget build(BuildContext context) {
    return  Column(children:  [
      const ContainerPrincipal(label: 'Escritorio',), StreamBuilder<List<Sobre>>(
        stream: _sobreService.getSobre(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nenhuma sócio encontrada.'),
            );
          } else {
            return  Padding(
              padding: const EdgeInsets.only(top: 16.0,left: 24,right: 24,bottom: 8),

              child: ListView.builder(
               shrinkWrap: true,
                controller:ScrollController(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return SobreListItem(socios: snapshot.data!.first);
                },
              ),
            );
          }
        },
      ),
      StreamBuilder<List<Socios>>(
        stream: _socioService.getSocios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nenhuma sócio encontrada.'),
            );
          } else {
            return   MediaQuery.of(context).size.width <= 1200
                ? Padding(
              padding: kIsWeb?const EdgeInsets.all(8.0):const EdgeInsets.only(left: 32.0,right: 32),
              child: ListView.builder(shrinkWrap: true,
                itemCount:  snapshot.data!.length,
                controller:ScrollController(),
                itemBuilder: (context, index) {
                  return SociosListItem(socios:  snapshot.data![index]);
                },),
            ):GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: height(context: context, size: .6),
                crossAxisCount: 3, // Define 3 itens por linha
                  crossAxisSpacing: 8.0, // Espaçamento horizontal entre os itens
                  mainAxisSpacing: 8.0, // Espaçamento vertical entre os itens
                ),shrinkWrap: true,

              controller:ScrollController(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return SociosListItem(socios: snapshot.data![index]);
                },

            );
          }
        },
      ),

    ],);}
}
