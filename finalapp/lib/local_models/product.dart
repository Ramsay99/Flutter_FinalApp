class Product {
  late final String model;
  String name = "ProductName";
  double price = 0;

  Product({required this.model, required this.name, this.price = 0});
}
