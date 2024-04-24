import 'package:flutter/cupertino.dart';

class ContatosPage extends StatelessWidget {
  final String label;

  const ContatosPage({required this.label});

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