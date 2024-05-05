import 'package:escritorio_advocacia_especilizado/core/models/eventos.dart';
import 'package:escritorio_advocacia_especilizado/utils/widgets/colors_customs.dart';
import 'package:escritorio_advocacia_especilizado/widgets/src/enviar_email.dart';
import 'package:escritorio_advocacia_especilizado/windows/administrativo/pages/agenda/widgets/cliente_details.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

import '../../../../../core/controllers/events_controller.dart';
import '../../../../../utils/calendario/calendario_day.dart';
import '../../../../../utils/calendario/format_date_time.dart';
import '../../../../../utils/contantes.dart';
import '../../../../../utils/launchs/url_launch.dart';
import '../../../../../utils/widgets/custom_text.dart';
import '../../../home_page_adm.dart';

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
        return InkWell(
          onTap: () {
            isOpen.value = !isOpen.value;
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
                      SizedBox(
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
                        width: 3,
                        color: statusDaAgenda(widget.evento.color!),
                        height: height(context: context, size: .1),
                      ),
                      if (widget.evento.cliente == null)
                        Container()
                      else
                       ClienteDetails(cliente:widget.evento.cliente!),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SizedBox(
                          width: width(context: context, size: .18),
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
                      InkWell(onTap: ()async{
                        final EventsService eventsService = EventsService();
                        eventsService.deletarEvento(widget.evento.id!);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePageAdm(pageSelected: 1,)),
                        );

                      },child: const Icon(
                        Mdi.delete,
                        color: Colors.red,
                      ),)
                    ]),
                    if (isOpen.value == true)
                      Padding(
                        padding: EdgeInsets.only(
                            top: width(context: context, size: .01)),
                        child: SizedBox(
                          width: width(context: context, size: .3),
                          child: TextMedium(
                            text: widget.evento.descricao,
                            fontSize: 20.0,
                          ),
                        ),
                      )
                    else
                      Container(),
                  ],
                )),
          ),
        );
      },
    );
  }
}
