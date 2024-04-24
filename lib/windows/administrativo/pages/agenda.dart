import 'package:flutter/cupertino.dart';

class AgendaPage extends StatelessWidget {
  final String label;

  const AgendaPage({required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}