import 'package:flutter/cupertino.dart';

class AreaTrabalhoPage extends StatelessWidget {
  final String label;

  const AreaTrabalhoPage({required this.label});

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