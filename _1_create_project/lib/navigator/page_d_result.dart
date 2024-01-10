import 'package:flutter/material.dart';

class PageD extends StatelessWidget {
  const PageD({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'Option A');
            },
            child: const Text('Option A'),
          ),
          ElevatedButton(
            onPressed: () {
              // 결과를 반환하고 이전 화면으로 돌아감
              Navigator.pop(context, 'Option B');
            },
            child: const Text('Option B'),
          )
        ],
      ),
    );
  }
}
