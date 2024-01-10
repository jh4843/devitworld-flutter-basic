import 'package:flutter/material.dart';

class PageC extends StatelessWidget {
  final String argText;

  const PageC({super.key, required this.argText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '(Route with argument)\nPage C\n$argText',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
