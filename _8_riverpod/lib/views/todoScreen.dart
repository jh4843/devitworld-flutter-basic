//import 'dart:convert';

import 'package:_8_riverpod/model/todo.dart';
import 'package:_8_riverpod/provider/todoNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListAsyncValue = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: todoListAsyncValue.when(
        data: (todoList) => ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final todo = todoList[index];
            return ListTile(
              title: Text(todo.description),
              leading: Icon(todo.completed
                  ? Icons.check_circle
                  : Icons.check_circle_outline),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => const Center(child: Text('An error occurred')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String description = '';
        return AlertDialog(
          title: const Text('Add Todo'),
          content: TextField(
            onChanged: (value) {
              description = value;
            },
            decoration: const InputDecoration(hintText: "Todo description"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add'),
              onPressed: () async {
                final newTodo = Todo(
                  id: _uuid.v4(),
                  description: description,
                  completed: false,
                );
                await ref.read(todoListProvider.notifier).addTodo(newTodo);
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
