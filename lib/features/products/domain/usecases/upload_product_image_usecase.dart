import 'dart:io';
import 'package:shopapp/features/products/domain/repositories/product_repository.dart';

class UploadProductImageUsecase {
  final ProductRepository productRepository;

  UploadProductImageUsecase({
    required this.productRepository,
  });

  Future<String> call(File image) async{
    return await productRepository.uploadProductImage(image);
  }
}