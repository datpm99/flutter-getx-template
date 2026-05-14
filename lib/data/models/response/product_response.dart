class ProductResponse {
  ProductResponse({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      products: json["products"] == null
          ? []
          : List<Product>.from(
              json["products"]!.map((x) => Product.fromJson(x)),
            ),
      total: json["total"] ?? 0,
      skip: json["skip"] ?? 0,
      limit: json["limit"] ?? 0,
    );
  }
}

class Product {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });

  final int id;
  final String title;
  final String description;
  final double price;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      price: json["price"] ?? 0.0,
    );
  }
}
