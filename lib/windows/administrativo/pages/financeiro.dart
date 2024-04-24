 import 'package:flutter/cupertino.dart';

class FinanceiroPage extends StatelessWidget {
  final String label;

  const FinanceiroPage({required this.label});

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