import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject/provider/user_provider.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Riverpod',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home:const Home(),
      );

  }
}


class Home extends ConsumerWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersNotifier = ref.watch(userProvider);
   return switch (usersNotifier) {
      AsyncData(:final value) => Padding(padding: const EdgeInsets.all(8.0),
      child: ListView.separated(itemBuilder: (cxt,i)=>Card(child: ListTile(title: Text(value[i].name ?? ''),),), separatorBuilder: (cxt,i)=> Divider(), itemCount: value.length),),
      AsyncError(:final error) => Text('error: $error'),
      _ => const Center(child:  CircularProgressIndicator(),),
    };
}
}


