import 'package:flutter/cupertino.dart';

class AreaTrabalhoPage extends StatelessWidget {
  final String label;

  const AreaTrabalhoPage({super.key, required this.label});

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