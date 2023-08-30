import 'package:flutter/material.dart';

class TituloCategoria extends StatelessWidget {
  final String text;

  const TituloCategoria({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Text(text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }
}
