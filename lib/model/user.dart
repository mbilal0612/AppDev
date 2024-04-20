
class User {
  int? id;
  String? name;
  String? userName;

  User({required this.id, required this.userName, required this.name});

  User.fromJson(Map<String,dynamic> json) {

    id = 1;
    name = json['name'];
    userName = json['userName'];

  }
}