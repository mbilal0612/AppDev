import 'dart:convert';

import 'package:testproject/model/user.dart';
import 'package:http/http.dart' as https;


class ApiClient {
  ApiClient();

  Future<List<User>> getUser() async {
    final response = await https.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    List<dynamic> jsonList = jsonDecode(response.body);
    List<User> userList = jsonList.map<User>((userjson) => User.fromJson(userjson)).toList();
    return userList;
  }


}