import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:testproject/home.dart';
import 'package:testproject/model/album_model.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
        useMaterial3: false,
      ),
      darkTheme: ThemeData.dark(),
      home: const Login(title: 'Login'),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => UserScreenState();
}

//list view builder only renders those that are being displayed on screen
// thats why its preferred to normals rows and columns

class UserScreenState extends State<Login> {
  //late will throw error when used before assigning
  late Future<List<Albums>> futureAlbumsList;

  Future<List<Albums>> fetchAlbums() async {
    Uri uriObject = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    final response = await http.get(uriObject);

    if (response.statusCode == 200) {
      List<dynamic> parseListJson = jsonDecode(response.body);

      //cant access by iterable through index
      List<Albums> items = List<Albums>.from(
        //map returns and interable
        parseListJson.map<Albums>((dynamic user) => Albums.fromJson(user)),
      );

      //.from is more optimized than .tolist()

      return items;
    } else {
      throw Exception('Failed to load album');
    }
  }

  //load the widget before do this stuff
  @override
  void initState() {
    super.initState();

    futureAlbumsList = fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: futureAlbumsList,
        //snapshot is the curret state of the data

        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var user = snapshot.data![index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("assets/catpic.jpeg"),
                      ),
                      title: Text(user.title),
                      subtitle: Text(index.toString()),
                      trailing: const Icon(Icons.visibility),
                    ),
                  );
                });
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return const CircularProgressIndicator();
        },
      )),
    );
  }
}
