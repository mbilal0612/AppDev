import 'package:flutter/material.dart';
import 'package:testproject/home.dart';

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
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: <Widget>[
          const SizedBox(height: 80),
          Column(
            children: [
              Image.asset('assets/diamond.png'),
              const SizedBox(height: 16.0),
              const Text('SHRINE')
            ],
          ),
          const SizedBox(height: 120.0),
          TextField(
            controller: _usernameController,
            decoration:
                const InputDecoration(filled: true, labelText: 'Username'),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextField(
            controller: _passwordController,
            decoration:
                const InputDecoration(filled: true, labelText: 'Password'),
            obscureText: true,
          ),
          OverflowBar(alignment: MainAxisAlignment.end, children: <Widget>[
            TextButton(
                onPressed: () {
                  _usernameController.text;
                  _usernameController.clear();
                  _passwordController.clear();
                },
                child: const Text('CANCEL')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Homepage()));
                },
                child: const Text('NEXT')),
          ])
        ])));
  }
}
