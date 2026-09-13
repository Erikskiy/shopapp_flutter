class ProductEntity {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final List<String> sizes;
  final bool isFavorite;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.sizes,
    this.isFavorite = false,
  });
}