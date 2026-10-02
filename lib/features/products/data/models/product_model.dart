import 'package:shopapp/features/products/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.ownerId,
    required super.name,
    required super.description,
    required super.price,
    required super.imageUrl,
    required super.category,
    required super.sizes,
    super.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      ownerId: json["ownerId"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      price: (json["price"] ?? 0).toDouble(),
      imageUrl: json["imageUrl"] ?? "",
      category: json["category"] ?? "",
      sizes: List<String>.from(
        json["sizes"] ?? [],
      ),
      isFavorite: json["isFavorite"] ?? false,
    );
  }
}