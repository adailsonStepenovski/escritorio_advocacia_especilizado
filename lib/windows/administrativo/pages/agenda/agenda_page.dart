import 'package:escritorio_advocacia_especilizado/windows/administrativo/pages/agenda/widgets/agenda_list_item.dart';
import 'package:escritorio_advocacia_especilizado/windows/administrativo/pages/cadastros/cadastrar_evento.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';
import '../../../../core/controllers/events_controller.dart';
import '../../../../core/models/eventos.dart';
import '../../../../utils/calendario/calendario_day.dart';
import '../../../../utils/calendario/format_date_time.dart';
import '../../../../utils/calendario/separar_por datas.dart';
import '../../../../utils/contantes.dart';
import '../../../../widgets/widgets/custom_text.dart';
import 'widgets/calendario_header.dart';

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
    hashCode: (dateTime) => dateTime.hashCode, // Usando o hashCode padrão
  );

  late final EventsService _eventsService; // Instância do serviço de eventos

  late PageController _pageController;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  late Map<DateTime, bool>
      _isOpenMap; // Mapa para armazenar o estado de abertura de cada dia

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _selectedDays.add(_focusedDay.value);
    _selectedEvents = ValueNotifier([]);
    _eventsService = EventsService(); // Inicializa o serviço de eventos
    _isOpenMap = {}; // Inicializa o mapa de estado de abertura
    _loadEvents(); // Carrega os eventos iniciais
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
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }

      _focusedDay.value = focusedDay;
      _rangeStart = null;
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    });

    _selectedEvents.value = _getEventsForDay(selectedDay);
  }

  List<Evento> _getEventsForRange(DateTime start, DateTime end) {
    return _selectedEvents.value.where((evento) {
      return evento.dataInicio!
              .isAfter(start.subtract(const Duration(days: 1))) &&
          evento.dataInicio!.isBefore(end.add(const Duration(days: 1)));
    }).toList();
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _focusedDay.value = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _selectedDays.clear();
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: width(context: context, size: 0.4),
          child: Column(
            children: [
              ValueListenableBuilder<DateTime>(
                valueListenable: _focusedDay,
                builder: (context, value, _) {
                  return CalendarHeader(
                    focusedDay: value,
                    clearButtonVisible: _selectedDays.isNotEmpty ||
                        _rangeStart != null ||
                        _rangeEnd != null,
                    onTodayButtonTap: () {
                      setState(() => _focusedDay.value = DateTime.now());
                    },
                    onClearButtonTap: () {
                      setState(() {
                        _rangeStart = null;
                        _rangeEnd = null;
                        _selectedDays.clear();
                        _selectedEvents.value = [];
                      });
                    },
                    onLeftArrowTap: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                    onRightArrowTap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                  );
                },
              ),
              TableCalendar<Evento>(
                firstDay: firstDay,
                lastDay: lastDay,
                focusedDay: _focusedDay.value,
                headerVisible: false,
                selectedDayPredicate: (day) => _selectedDays.contains(day),
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                calendarFormat: _calendarFormat,
                rangeSelectionMode: _rangeSelectionMode,
                eventLoader: _getEventsForDay,
                holidayPredicate: (day) {
                  return day.day == 20;
                },
                onDaySelected: _onDaySelected,
                onRangeSelected: _onRangeSelected,
                onCalendarCreated: (controller) => _pageController = controller,
                onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() => _calendarFormat = format);
                  }
                },
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: ValueListenableBuilder<List<Evento>>(
            valueListenable: _selectedEvents,
            builder: (context, events, _) {
              var groupedEvents = groupEventsByDay(events);

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
                      itemCount: groupedEvents.length,
                      itemBuilder: (context, index) {
                        var eventosNoDia = groupedEvents[index];
                        var dia = eventosNoDia.first.dataInicio!.day;
                        var mes = eventosNoDia.first.dataInicio!.month;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, bottom: 8.0, left: 32.0),
                              child: TextBold(
                                text: '$dia  ${mesPorExtenso(mes)}',
                                fontSize: 24.0,
                                onTap: () {
                                  setState(() {
                                    // Toggle isOpen for the current day
                                    _isOpenMap.update(
                                      eventosNoDia.first.dataInicio!,
                                      (value) => !value,
                                      ifAbsent: () => true,
                                    );
                                  });
                                },
                              ),
                            ),
                            // Lista de eventos para esse dia
                            if (_isOpenMap[eventosNoDia.first.dataInicio!] ??
                                true) // Verifica se o dia está aberto no mapa
                              ...eventosNoDia
                                  .map((evento) =>
                                      AgendaListItem(evento: evento))
                                  .toList(),
                          ],
                        );
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
