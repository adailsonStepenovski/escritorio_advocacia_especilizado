import 'package:escritorio_advocacia_especilizado/core/models/eventos.dart';
import 'package:escritorio_advocacia_especilizado/utils/widgets/colors_customs.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/calendario/calendario_day.dart';
import '../../../../../utils/calendario/format_date_time.dart';
import '../../../../../utils/contantes.dart';
import '../../../../../utils/widgets/custom_text.dart';
class AgendaListItem extends StatefulWidget {
  final Evento evento;

  const AgendaListItem({super.key, required this.evento});

  @override
  State<AgendaListItem> createState() => _AgendaListItemState();
}
class _AgendaListItemState extends State<AgendaListItem> {
  late final ValueNotifier<bool> isOpen; // Remova a inicialização aqui

  @override
  void initState() {
    super.initState();
    isOpen = ValueNotifier(false); // Defina o valor inicial aqui
  }

  @override
  void dispose() {
    isOpen.dispose(); // Lembre-se de descartar o ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isOpen,
        builder: (context, value, _) {
      return InkWell(onTap: (){
        isOpen.value=!isOpen.value;
      },
        child: Material(
        type: MaterialType.card,
        color: Theme.of(context).cardColor,
        elevation: 1,
        clipBehavior: Clip.none,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
                children: [
                  Row(children: [
                    Container(
                      width: width(context: context, size: .1),
                      height: height(context: context, size: .1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: TextBold(
                              fontSize: 26,
                              text:
                              '${widget.evento.dataInicio!.hour}:${formatMinutes(widget.evento.dataInicio!.minute)}',
                              fontColor: CustomColors.primary,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextBold(
                              fontSize: 20,
                              text:
                              '${widget.evento.dataFinal!.hour}:${formatMinutes(widget.evento.dataFinal!.minute)}',
                              fontColor: CustomColors.lightGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 3.0, // Set the desired width
                      color:statusDaAgenda(widget.evento.color!),
                      height: height(context: context, size: .1),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: SizedBox(
                        width: width(context: context, size: .1),
                        height: height(context: context, size: .1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextMedium(
                              text: widget.evento.title,
                              fontSize: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  if (isOpen.value == true)
                  SizedBox(
                      width: width(context: context, size: .4),
                      child: TextMedium(
                        text: widget.evento.descricao,
                        fontSize: 20.0,
                      ),
                    )
                  else
                    Container(),
                ],
              )
        ),
            ),
      );
  },
  );
  }
}
