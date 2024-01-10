import 'package:_4_database/src/sqlite/model/todo.dart';
import 'package:_4_database/src/sqlite/utils/sqlite_helper.dart';
import 'package:sqflite/sqflite.dart';

class TodoDatabase {
  static Future<void> insertTodo(Todo todo) async {
    final db = await SqliteHelper.getDatabase();
    await db.insert('todos', todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Todo>> getTodos() async {
    final db = await SqliteHelper.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['title'],
        content: maps[i]['content'],
        active: maps[i]['active'],
      );
    });
  }

  static Future<void> updateTodo(Todo todo) async {
    final db = await SqliteHelper.getDatabase();
    await db.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  static Future<void> deleteTodo(int id) async {
    final db = await SqliteHelper.getDatabase();
    await db.delete(
      'todos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
