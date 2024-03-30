import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testproject/model/todo.dart';

class TodoService {
  Future<List<Todo>> getAllTodos() async {
    String url = "https://jsonplaceholder.typicode.com/todos";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;

      //map returns an item on each iteration
      final todos = json.map((e) {
        return Todo(
            id: e['id'],
            title: e['title'],
            userId: e['userId'],
            completed: e['completed']);
      }).toList();

      return todos;
    }
    return [];
  }
}
