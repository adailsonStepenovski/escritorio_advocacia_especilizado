import 'package:escritorio_advocacia_especilizado/utils/widgets/colors_customs.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../../../../core/models/noticias_model.dart';
import '../../../../utils/contantes.dart';
import '../../../../utils/widgets/custom_text.dart';
import '../../../../utils/widgets/ui_card.dart';
import '../../../../utils/widgets/ui_card_avatar.dart';
import '../../../../utils/widgets/ui_card_button.dart';
import '../../../../utils/widgets/ui_tile_card.dart';

class NoticiaListItem extends StatelessWidget {
  final Noticia noticia;
  const NoticiaListItem( {required this.noticia,super.key});

  @override
  Widget build(BuildContext context) {
    return   GFCard(
      boxFit: BoxFit.cover,
      titlePosition: GFPosition.start,
      elevation: 8,heightCard:  MediaQuery.of(context).size.width <= 1200
        ? height(context: context, size: .55):height(context: context, size: .2),
      image: noticia.foto == ''
          ? Image.asset('assets/logo_losangulo.png',
        height: height(context: context, size: 0.2),
        width: width(context: context, size: 0.2),
        fit: BoxFit.contain,)
          : Image.network(
        noticia.foto,
        height: height(context: context, size: 0.2),
        width: width(context: context, size: 0.2),
        fit: BoxFit.cover,
      ),
      showImage: true,
      title: GFListTile(
        avatar: GFAvatar(
          backgroundImage: const AssetImage(
            'assets/logo_losangulo.png',
          ),
          backgroundColor: CustomColors.white,
          size: width(context: context, size: .05),
        ),
        titleText: noticia.titulo,
        subTitleText: noticia.subtitulo,
      ),
      content: TextLight(fontSize:
      width(context: context, size: .01),
        fontColor: Colors.black54,text:noticia.resumo.length > 120
            ? '${noticia.resumo.substring(0, 164)}...'
            : noticia.resumo,),
      buttonBar: const GFButtonBar(
        children: <Widget>[
          GFAvatar(
            backgroundColor: CustomColors.primary,
            child: Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
          GFAvatar(
            backgroundColor: CustomColors.secondary,
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          GFAvatar(
            backgroundColor: CustomColors.black,
            child: Icon(
              Mdi.whatsapp,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

