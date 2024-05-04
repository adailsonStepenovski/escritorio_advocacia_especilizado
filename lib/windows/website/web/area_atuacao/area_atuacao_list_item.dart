import 'package:escritorio_advocacia_especilizado/utils/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../../../../core/models/area_atuacao.dart';
import '../../../../utils/contantes.dart';
import '../../../../utils/widgets/ui_card.dart';

class AreasAtuacaoListItem extends StatelessWidget {
  final AreasAtuacao areasAtuacao;
  const AreasAtuacaoListItem( {required this.areasAtuacao,super.key});

  @override
  Widget build(BuildContext context) {

    return    GFCard(
      boxFit: BoxFit.cover,
      titlePosition: GFPosition.start,
      elevation: 8,heightCard:  height(context: context, size: .45),
      showImage: true,
      content: Row(
        children: [
          SizedBox( width:MediaQuery.of(context).size.width <= 1200
          ?width(context: context, size: .2):width(context: context, size: .1),
            child: TextExtraBold(fontSize:MediaQuery.of(context).size.width <= 1200
                ?width(context: context, size: .015):width(context: context, size: .01),
              fontColor: Colors.black54,text: areasAtuacao.nome,),
          ),
          SizedBox( width:MediaQuery.of(context).size.width <= 1200
              ?width(context: context, size: .5):width(context: context, size: .3),
            child: TextLight(fontSize:MediaQuery.of(context).size.width <= 1200
                ?width(context: context, size: .015):width(context: context, size: .01),
              fontColor: Colors.black54,text: areasAtuacao.descricao,),
          ),
        ],
      ),
    );
  }
}
