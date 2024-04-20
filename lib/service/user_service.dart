import 'dart:convert';

import 'package:testproject/model/user.dart';
import 'package:http/http.dart' as https;


class ApiClient {
  ApiClient();

  Future<List<User>> getUser() async {
    var _uri = Uri.https('https://jsonplaceholder.typicode.com/users');
    final response = await https.get(_uri);
    List<dynamic> jsonList = jsonDecode(response.body);
    List<User> userList = jsonList.map<User>((userjson) => User.fromJson(userjson)).toList();
    return userList;
  }


}