class Product {
  final String imageUrl;
  final String name;
  final String price;

  Product({required this.imageUrl, required this.name, required this.price});
}

List<Product> mockProducts = [
  Product(imageUrl: 'assets/catpic.jpeg', name: 'Cat', price: "\$10.00"),
  Product(imageUrl: 'assets/diamond.png', name: 'Diamond', price: "\$100.00"),
  Product(imageUrl: 'assets/flutter.png', name: 'flutter', price: '\$1234')
];
