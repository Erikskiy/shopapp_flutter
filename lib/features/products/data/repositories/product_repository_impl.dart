import 'dart:io';

import 'package:shopapp/features/products/data/datasources/remote/product_cloudinary_datasource.dart';
import 'package:shopapp/features/products/data/datasources/remote/product_firebase_datasource.dart';
import 'package:shopapp/features/products/domain/entities/product_entity.dart';
import 'package:shopapp/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository{
  final ProductFirebaseDatasource productFirebaseDatasource;
  final ProductCloudinaryDatasource productCloudinaryDatasource;

  ProductRepositoryImpl({
    required this.productFirebaseDatasource,
    required this.productCloudinaryDatasource,
  });

  @override
  Future<void> add_product(ProductEntity product) async{
    await productFirebaseDatasource.add_product(product);
  }

  @override
  Future<String> uploadProductImage(File image) async{
    return await productCloudinaryDatasource.uploadProductImage(image);
  }

  @override
  Future<List<ProductEntity>> getMyProducts() async{
    return await productFirebaseDatasource.getMyProducts();
  }
}