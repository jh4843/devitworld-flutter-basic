// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
import 'package:_8_riverpod/model/activity.dart';
import 'package:_8_riverpod/provider/basicProvider.dart';
import 'package:_8_riverpod/views/todoScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicScreen extends ConsumerWidget {
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String hello = ref.read(helloWorldProvider);
    final AsyncValue<Activity> activity = ref.watch(
      activityProvider('recreational'),
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Riverpod Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(hello),
              activity.when(
                data: (activity) => Text(activity.activity),
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => Text('Error: $error'),
              ),
              //button to go todoSCreen.dart
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TodoScreen()),
                  );
                },
                child: const Text('Go to TodoScreen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
