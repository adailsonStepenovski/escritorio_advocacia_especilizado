import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:screenshot/screenshot.dart';
import '../../../../core/models/socios.dart';
import '../../../../utils/contantes.dart';
import '../../../../utils/widgets/colors_customs.dart';
import '../../../../utils/widgets/custom_text.dart';
import '../../../../utils/widgets/ui_card.dart';
import '../../../../utils/widgets/ui_card_avatar.dart';
import '../../../../utils/widgets/ui_card_button.dart';
import '../../../../utils/widgets/ui_tile_card.dart';

class SociosListItem extends StatefulWidget {
  final Socios socios;
  const SociosListItem({super.key, required this.socios});

  @override
  State<SociosListItem> createState() => _SociosListItemState();
}

class _SociosListItemState extends State<SociosListItem> {
  late ScreenshotController screenshotController;

  @override
  void initState() {
    super.initState();
    screenshotController = ScreenshotController();
  }

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: GFCard(
        boxFit: BoxFit.cover,
        titlePosition: GFPosition.start,
        elevation: 8,
        heightCard: height(context: context, size: .55),
        image: widget.socios.foto == ''
            ? Image.asset(
          'assets/logo_losangulo.png',
          height: height(context: context, size: 0.2),
          width: width(context: context, size: 0.2),
          fit: BoxFit.contain,
        )
            : Image.network(
          widget.socios.foto,
          height: height(context: context, size: 0.1),
          width: width(context: context, size: 0.2),
          fit: BoxFit.cover,
        ),
        showImage: true,
        title: GFListTile(heigthTitle: 0.05,heigthSubtitle: 0.04,
          titleText: widget.socios.nome,
          subTitleText: widget.socios.funcao,
        ),
        content: TextLight(
          fontSize: height(context: context, size: .02),
          fontColor: Colors.black54,
          text: widget.socios.descricao.length > 120
              ? '${widget.socios.descricao.substring(0, 164)}...'
              : widget.socios.descricao,
        ),
        buttonBar: GFButtonBar(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _compartilharScreenshot();
              },
              child: const GFAvatar(
                backgroundColor: CustomColors.primary,
                child: Icon(
                  Icons.share,
                  color: Colors.black,
                ),
              ),
            ),
            const GFAvatar(
              backgroundColor: CustomColors.secondary,
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            const GFAvatar(
              backgroundColor: CustomColors.black,
              child: Icon(
                Mdi.whatsapp,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _compartilharScreenshot() async {
    // Captura o screenshot
    final capturedImage = await screenshotController.capture();

    if (capturedImage != null) {
      // Converter a imagem para base64
     // final base64Image = base64Encode(capturedImage);

      // Criação de uma URL com a imagem codificada em base64
      //Uri whatsappUrl = Uri.parse('whatsapp://send?text=Veja a imagem&image=${Uri.encodeComponent(base64Image)}');

      // Abre o link no WhatsApp
      try {
      } catch (e) {
        // Lidar com erros ao abrir a URL no WhatsApp
      }
    }
  }


}