import 'package:flutter/material.dart';
import 'package:testproject/model/product.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  List<Card> _buildGridCards(BuildContext context) {
    if (mockProducts.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);

    return mockProducts.map((product) {
      return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.asset(
                    product.imageUrl,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(product.name, style: theme.textTheme.titleLarge),
                        const SizedBox(height: 8.0),
                        Text(
                          product.price,
                          style: theme.textTheme.titleSmall,
                        ),
                      ]),
                ))
              ]));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                semanticLabel: 'menu',
              )),
          title: const Text('SHRINE'),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, semanticLabel: 'search'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.tune,
                semanticLabel: 'filter',
              ),
            )
          ],
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 8.0 / 9.0),
            padding: const EdgeInsets.all(16.0),
            itemCount: mockProducts.length,
            itemBuilder: (context, index) {
              return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 18.0 / 11.0,
                          child: Image.asset(
                            mockProducts[index].imageUrl,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Expanded(
                            child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  mockProducts[index].name,
                                  // style: theme.textTheme.titleLarge
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  mockProducts[index].price,
                                  // style: theme.textTheme.titleSmall,
                                ),
                              ]),
                        ))
                      ]));
            })
        // GridView.count(
        //     crossAxisCount: 2,
        //     padding: const EdgeInsets.all(16.0),
        //     childAspectRatio: 8.0 / 9.0,
        //     children: _buildGridCards(context))
        // : const Center(
        //     child: Text('No data found'),
        //   ),
        );
  }
}
