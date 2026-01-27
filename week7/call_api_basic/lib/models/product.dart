class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Factory constructor to create Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? 'No name',
      description: json['des'] ?? 'No description',
      price: (json['price'] ?? 0).toDouble(),
      imageUrl: json['imgURL'] ?? '',
    );
  }

  // Convert Product to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'des': description,
      'price': price,
      'imgURL': imageUrl,
    };
  }
}
