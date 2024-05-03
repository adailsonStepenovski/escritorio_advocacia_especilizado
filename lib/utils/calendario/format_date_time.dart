String formatMinutes(int minutes) {
  return minutes < 10 ? '0$minutes' : '$minutes';
}
final DateTime firstDay =
DateTime(DateTime.now().year, DateTime.now().month, 1);
final DateTime lastDay =
DateTime(DateTime.now().year, DateTime.now().month + 1, 0);