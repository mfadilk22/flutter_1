import 'package:flutter/cupertino.dart';
import 'package:flutter_1/Models/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: "Desain UI Landing Page",
      description: "Lorem ipsum",
      id: '',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Desain UI 3",
      description: "Lorem ipsum",
      id: '',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Desain UI 4",
      description: "Lorem ipsum",
      id: '',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: "Desain UI 5",
      description: "Lorem ipsum",
      id: '',
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);

    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;

    notifyListeners();
  }
}
