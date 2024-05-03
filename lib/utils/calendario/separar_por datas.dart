
import 'package:escritorio_advocacia_especilizado/utils/calendario/calendario_day.dart';

import '../../core/models/eventos.dart';

List<List<Evento>> groupEventsByDay(List<Evento> eventos) {
  eventos.sort((a, b) => a.dataInicio!.compareTo(b.dataInicio!));

  List<List<Evento>> groupedEvents = [];
  List<Evento> currentDayEvents = [];
  DateTime? currentDay; // Alteração aqui

  for (var evento in eventos) {
    if (currentDay == null || !isSameDayCustoms(currentDay, evento.dataInicio!)) {
      // Alteração aqui
      if (currentDayEvents.isNotEmpty) {
        groupedEvents.add(currentDayEvents);
      }
      currentDay = evento.dataInicio;
      currentDayEvents = [evento];
    } else {
      currentDayEvents.add(evento);
    }
  }

  if (currentDayEvents.isNotEmpty) {
    groupedEvents.add(currentDayEvents);
  }

  return groupedEvents;
}