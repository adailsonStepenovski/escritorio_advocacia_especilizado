import 'package:escritorio_advocacia_especilizado/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/sobre.dart';
import '../../../../utils/contantes.dart';
import '../../../../utils/widgets/ui_card.dart';
import '../../../../utils/widgets/ui_tile_card.dart';

class SobreListItem extends StatelessWidget {
  final Sobre socios;
  const SobreListItem( {required this.socios,super.key});

  @override
  Widget build(BuildContext context) {

    return    GFCard(
      boxFit: BoxFit.cover,
      titlePosition: GFPosition.start,
      elevation: 8,heightCard:  height(context: context, size: .3),
      showImage: true,
      title: GFListTile(
        avatar: Container(),
      ),
      content: TextLight(fontSize: height(context: context, size: .02),
        fontColor: Colors.black54,text: socios.descricao,),
    );
  }
}
