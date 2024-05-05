import 'package:escritorio_advocacia_especilizado/utils/widgets/colors_customs.dart';
import 'package:escritorio_advocacia_especilizado/windows/administrativo/pages/agenda/widgets/agenda_list_item.dart';
import 'package:escritorio_advocacia_especilizado/windows/administrativo/pages/cadastros/cadastrar_evento.dart';

import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';
import '../../../../core/controllers/events_controller.dart';
import '../../../../core/models/eventos.dart';
import '../../../../utils/calendario/calendario_day.dart';
import '../../../../utils/contantes.dart';
import '../../../../utils/widgets/custom_text.dart';
import '../../../../utils/widgets/font_style.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({super.key});

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  late final ValueNotifier<List<Evento>> _selectedEvents;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDayCustoms,
    hashCode: (dateTime) => dateTime.hashCode,
  );

  late final EventsService _eventsService;

  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    _selectedDays.add(_focusedDay.value);
    _selectedEvents = ValueNotifier([]);
    _eventsService = EventsService();
    _loadEvents();
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  Future<void> _loadEvents() async {
    final events = await _eventsService.getEventos().first;
    setState(() {
      _selectedEvents.value = events;
    });
  }

  List<Evento> _getEventsForDay(DateTime day) {
    return _selectedEvents.value.where((evento) {
      return evento.dataInicio?.year == day.year &&
          evento.dataInicio?.month == day.month &&
          evento.dataInicio?.day == day.day;
    }).toList();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDays.clear();
      _selectedDays.add(selectedDay);
      _focusedDay.value = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(top: height(context: context, size: 0.1)),
          child: SizedBox(
            width: width(context: context, size: 0.4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TableCalendar<Evento>(
                  firstDay: DateTime(
                      DateTime.now().year, DateTime.now().month - 12, 1),
                  lastDay: DateTime(
                      DateTime.now().year, DateTime.now().month + 12, 0),
                  locale: 'pt_BR',
                  rowHeight: 75, daysOfWeekHeight: 75,
                  calendarStyle:
                      CalendarStyle(defaultTextStyle: fontOldStandardTt(fontSize: 32)),
                  headerStyle: HeaderStyle(
                      titleTextStyle: fontOldStandardTt(
                          fontSize: 36, color: CustomColors.primary)),
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: fontOldStandardTt(
                          fontSize: 20, color: CustomColors.primary),
                      weekendStyle: fontOldStandardTt(fontSize: 20, color: CustomColors.red)),
                  focusedDay: _focusedDay.value,
                  selectedDayPredicate: (day) => _selectedDays.contains(day),
                  eventLoader: _getEventsForDay,
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() => _calendarFormat = format);
                    }
                  },
                  onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
                  onDaySelected: _onDaySelected,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ValueListenableBuilder<List<Evento>>(
            valueListenable: _selectedEvents,
            builder: (context, events, _) {
              final eventsForSelectedDay = events
                  .where((evento) =>
                      evento.dataInicio!.year == _focusedDay.value.year &&
                      evento.dataInicio!.month == _focusedDay.value.month &&
                      evento.dataInicio!.day == _focusedDay.value.day)
                  .toList();

              return Column(
                children: [
                  SizedBox(
                    width: width(context: context, size: .4),
                    // Set the desired width
                    height: height(context: context, size: .1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width(context: context, size: .25),
                          child: const TextBold(
                            text: 'Sua Agenda',
                          ),
                        ),
                        const Icon(Mdi.searchWeb),
                        InkWell(
                            child: Icon(Mdi.plus),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const CadastrarEvento();
                                },
                              );
                            })
                      ],
                    ),
                  ),
                  Expanded(
                    // Adicionando Expanded aqui
                    child: ListView.builder(
                      itemCount: eventsForSelectedDay.length,
                      itemBuilder: (context, index) {
                        final evento = eventsForSelectedDay[index];
                        return AgendaListItem(evento: evento);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
