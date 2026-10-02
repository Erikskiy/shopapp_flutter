import 'dart:io';

import 'package:shopapp/features/products/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<void> add_product(ProductEntity product);

  Future<String> uploadProductImage(File image);

  Future<List<ProductEntity>> getMyProducts();
}