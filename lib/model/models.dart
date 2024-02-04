// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:missiomanager/database/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

class Todo {
  String id;
  String title;
  String description;
  DateTime date;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  static Todo fromMap(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        date: DateTime.parse(json['date']),
      );

  Map<String, Object?> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'date': date.toIso8601String(),
      };
  delete() async {
    Database db = await SQLHelper.db();
    await db.delete('todos', where: 'id=?', whereArgs: [id]);
  }

  Future<void> update({
    required String id,
    required String title,
    required String description,
    required DateTime date,
  }) async {
    Database db = await SQLHelper.db();
    await db.update(
        'todos',
        {
          'title': title,
          'description': description,
          'date': date
        },
        where: 'id=?',
        whereArgs: [id]);
  }

  static Future<Todo> create(
      {required String title,
      required String description,
      required DateTime datetime}) async {
    Database db = await SQLHelper.db();
    String id = const Uuid().v4();

    Todo todo =
        Todo(id: id, title: title, description: description, date: datetime);

    await db.insert('todos', todo.toMap());
    return todo;
  }

  static Future<List<Todo>> all() async {
    Database db = await SQLHelper.db();

    return (await db.query('todos')).map<Todo>((e) => Todo.fromMap(e)).toList();
  }
}
