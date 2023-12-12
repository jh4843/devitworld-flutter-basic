import 'package:flutter/material.dart';

class MyStatelessPage extends StatelessWidget {
  const MyStatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'StatelessWidget Example',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
