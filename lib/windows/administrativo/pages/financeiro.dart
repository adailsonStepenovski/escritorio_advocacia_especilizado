 import 'package:flutter/cupertino.dart';

class FinanceiroPage extends StatelessWidget {
  final String label;

  const FinanceiroPage({super.key, required this.label});

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