import 'package:flutter/cupertino.dart';

class AtendimentoPage extends StatelessWidget {
  final String label;

  const AtendimentoPage({required this.label});

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