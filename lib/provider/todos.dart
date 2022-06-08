import 'package:flutter/cupertino.dart';
import 'package:flutter_1/Models/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: "Desain UI Landing Page",
      description: "Lorem ipsum",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Desain UI 3",
      description: "Lorem ipsum",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Desain UI 4",
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Desain UI 5",
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone).toList();
}
