import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../../../../core/controllers/noticias_controller.dart';
import '../../../../core/models/noticias_model.dart';
import '../../../../utils/contantes.dart';
import '../../../../widgets/widgets/colors_customs.dart';
import '../../../../widgets/widgets/ui_app_textfield.dart';
import '../../../../widgets/widgets/ui_web_button.dart';
import '../../widgets/function_imagem_get.dart';

class CadastrarNoticia extends StatefulWidget {
  const CadastrarNoticia({super.key});

  @override
  State<CadastrarNoticia> createState() => _CadastrarNoticiaState();
}

class _CadastrarNoticiaState extends State<CadastrarNoticia> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController subtituloController = TextEditingController();
  TextEditingController temaController = TextEditingController();
  TextEditingController resumoController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  ValueNotifier<String> foto = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        height: height(context: context, size: 1),
        width: width(context: context, size: 0.5),
        color: CustomColors.lightGrey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ValueListenableBuilder<String>(
                  valueListenable: foto,
                  builder: (context, value, _) {
                    if (value.isEmpty) {
                      return IconButton(
                        icon: const Icon(Icons.add_photo_alternate),
                        onPressed: () async {
                          final result = await showDialog(
                            context: context,
                            builder: (_) => const GetImageDialog(
                              title: 'Selecionar imagem',
                              text: 'Escolha a fonte da imagem',
                              descriptions: 'Escolha a fonte da imagem',
                            ),
                          );

                          if (result != null) {
                            String? fotoTemp = await uploadToFirebaseStorage(
                              result,
                              'foto_noticia',
                            );

                            if (fotoTemp != null) {
                              foto.value = fotoTemp;
                            }
                          }
                        },
                      );
                    } else {
                      return Image.network(value);
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      label: 'Título',
                      controller: tituloController,
                      prefixIcon: const Icon(Mdi.accountCircle),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 24),
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      label: 'Subtítulo',
                      controller: subtituloController,
                      prefixIcon: const Icon(Mdi.lock),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 24),
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      label: 'Descricao',
                      controller: descricaoController,
                      prefixIcon: const Icon(Mdi.lock),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 24),
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      label: 'Resumo',
                      controller: resumoController,
                      prefixIcon: const Icon(Mdi.lock),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, bottom: 24),
                  child: SizedBox(
                    height: 80,
                    child: CustomTextField(
                      label: 'Tema',
                      controller: temaController,
                      prefixIcon: const Icon(Mdi.lock),
                    ),
                  ),
                ),
                UIAppButton(
                  buttonHeight: height(context: context, size: 0.08),
                  buttonWidth: width(context: context, size: 0.2),
                  label: 'Cadastrar',
                  isLoading: false,
                  onPressed: () async {
                    final NoticiaService noticiaService = NoticiaService();
                    noticiaService.adicionarNoticia(
                      Noticia(
                        titulo: tituloController.text,
                        subtitulo: subtituloController.text,
                        tema: temaController.text,
                        resumo: resumoController.text,
                        descricao: descricaoController.text,
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                        foto: foto.value,
                        visivel: true,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
