import 'package:flutter/cupertino.dart';

class ProcessoCasosPage extends StatelessWidget {
  final String label;

  const ProcessoCasosPage({required this.label});

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