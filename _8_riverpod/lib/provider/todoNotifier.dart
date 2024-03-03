import 'package:_8_riverpod/model/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todoNotifier.g.dart';

const _uuid = Uuid();

@riverpod
class TodoList extends _$TodoList {
  final List<Todo> _todos = [
    Todo(id: _uuid.v4(), description: 'Learn Flutter', completed: true),
    Todo(id: _uuid.v4(), description: 'Learn Riverpod'),
  ];

  @override
  Future<List<Todo>> build() async {
    return _todos;
  }

  List<Todo> get todos => _todos;

  Future<void> addTodo(Todo todo) async {
    // if you want to post data using this one
    // await http.post(
    //   Uri.https('your_api.com', '/todos'),
    //   // Port to server.
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode(todo.toJson()),
    // );

    _todos.add(todo);
    // update new state and notify listeners
    state = AsyncData(_todos);
  }
}
