import 'package:flutter/material.dart';

class MyStatefulPage extends StatefulWidget {
  const MyStatefulPage({super.key});

  @override
  _MyStatefulPageState createState() => _MyStatefulPageState();
}

class _MyStatefulPageState extends State<MyStatefulPage> {
  String text = 'StatefulWidget Example';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 30),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                text = 'State is Changed!';
              });
            },
            child: const Text('Button'),
          ),
        ],
      ),
    );
  }
}
