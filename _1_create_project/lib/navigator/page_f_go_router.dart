import 'package:flutter/material.dart';

class PageF extends StatelessWidget {
  final String argText;

  const PageF({super.key, required this.argText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '(Go Router)\nPage F $argText',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
