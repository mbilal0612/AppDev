class Todo {
  final int id;
  final String name;
  final String username;
  final String email;

  Todo({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });
}
