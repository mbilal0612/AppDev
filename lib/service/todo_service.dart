import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:testproject/model/todo.dart';

class TodoService {
  final dio = Dio();

  Future<List<Todo>> getAllTodos() async {
    Response response =
        await dio.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      final json = response.data as List;

      //map returns an item on each iteration
      final todos = json.map((e) {
        return Todo(
            id: e['id'],
            name: e['name'],
            username: e['username'],
            email: e['email']);
      }).toList();

      return todos;
    }
    return [];
  }
}
