import 'package:flutter/cupertino.dart';

class DocumentoPage extends StatelessWidget {
  final String label;

  const DocumentoPage({required this.label});

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