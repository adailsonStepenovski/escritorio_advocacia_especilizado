import 'package:flutter/cupertino.dart';

class AtendimentoPage extends StatelessWidget {
  final String label;

  const AtendimentoPage({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}