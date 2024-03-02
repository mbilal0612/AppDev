import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testproject/model/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<List<Products>> _fetchProducts() async {
  Uri uriObject = Uri.parse("https://dummyjson.com/products");

  final response = await http.get(uriObject);

  if (response.statusCode == 200) {
    var parsedJsonList = jsonDecode(response.body);

    List<Products> productsList = parsedJsonList['products']
        .map<Products>((dynamic u) => Products.fromJson(u))
        .toList();
    return productsList;
  } else {
    throw Exception("Failed to get data");
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child: Text("Products")),
      ),
      body: FutureBuilder<List<Products>>(
        future: _fetchProducts(), // This is your Future task that fetches data
        builder:
            (BuildContext context, AsyncSnapshot<List<Products>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the task is happening, show a loading spinner
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there's an error, display an error message
            return Text('Error: ${snapshot.error}');
          } else {
            // When the task is done, show the fetched data
            return ListView.builder(itemBuilder: (context, index) {
              Products product = snapshot.data![index];
              return Card(
                color: Colors.greenAccent,
                child: Column(children: [
                  Image.network(product.thumbnail.toString()),
                  Row(
                    children: [
                      Text(product.title.toString()),
                      Text(product.price.toString()),
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Card(
                                    child: Row(children: [
                                      Text(product.title.toString()),
                                      Text(product.description.toString()),
                                    ]),
                                  );
                                });
                          },
                          icon: const Icon(Icons.remove_red_eye_sharp)),
                    ],
                  )
                ]),
              );
            });
          }
        },
      ),
    );
  }
}
