import 'package:_4_database/src/sqlite/model/todo.dart';
import 'package:_4_database/src/sqlite/service/todo_database.dart';
import 'package:flutter/material.dart';

class MySqliteView extends StatefulWidget {
  const MySqliteView({
    Key? key,
  }) : super(key: key);

  @override
  State<MySqliteView> createState() => _MySqliteViewState();
}

class _MySqliteViewState extends State<MySqliteView> {
  late List<Todo> _todos;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _refreshTodos();
  }

  void _addNewTodo() async {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    bool active = false;

    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: const Text('Add New Todo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: contentController,
                  decoration: const InputDecoration(labelText: 'Contents'),
                ),
                Row(
                  children: [
                    const Text('Active'),
                    Checkbox(
                      value: active,
                      onChanged: (bool? newValue) {
                        setState(() {
                          active = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
              TextButton(
                child: const Text('Add'),
                onPressed: () async {
                  final String title = titleController.text;
                  final String content = contentController.text;

                  if (title.isNotEmpty && content.isNotEmpty) {
                    await TodoDatabase.insertTodo(Todo(
                      title: title,
                      content: content,
                      active: active ? 1 : 0,
                    ));
                    _refreshTodos();
                    Navigator.of(ctx).pop();
                  }
                },
              ),
            ],
          );
        });
      },
    );
  }

  void _editTodo(Todo todo) async {
    final titleController = TextEditingController(text: todo.title);
    final contentController = TextEditingController(text: todo.content);
    bool active = todo.active == 1;

    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return AlertDialog(
                title: const Text('Edit Todo'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: contentController,
                      decoration: const InputDecoration(labelText: 'Contents'),
                    ),
                    Row(
                      children: [
                        const Text('Active'),
                        Checkbox(
                          value: active,
                          onChanged: (bool? newValue) {
                            setState(() {
                              active = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Save'),
                    onPressed: () async {
                      final String updatedTitle = titleController.text;
                      final String updatedContent = contentController.text;

                      if (updatedTitle.isNotEmpty &&
                          updatedContent.isNotEmpty) {
                        await TodoDatabase.updateTodo(Todo(
                          id: todo.id,
                          title: updatedTitle,
                          content: updatedContent,
                          active: active ? 1 : 0,
                        ));
                        _refreshTodos();
                        Navigator.of(ctx).pop();
                      }
                    },
                  ),
                ],
              );
            },
          );
        });
  }

  Future _refreshTodos() async {
    setState(() => _isLoading = true);
    _todos = await TodoDatabase.getTodos();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshTodos,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(_todos[index].title ?? 'No Title'),
                  subtitle: Row(
                    children: [
                      Text(_todos[index].content ?? 'No Content'),
                      Checkbox(
                        value: _todos[index].active == 1,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _todos[index].active = newValue! ? 1 : 0;
                            TodoDatabase.updateTodo(_todos[index]);
                          });
                        },
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    color: Colors.pink,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: const Text('Are you sure?'),
                          content: const Text(
                            'Do you want to remove the todo?',
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Cancel'),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                            ),
                            TextButton(
                              child: const Text('Delete'),
                              onPressed: () async {
                                await TodoDatabase.deleteTodo(
                                    _todos[index].id!);
                                _refreshTodos();
                                Navigator.of(ctx).pop();
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  onTap: () => _editTodo(_todos[index]),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTodo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
