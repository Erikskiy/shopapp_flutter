import 'package:shopapp/features/products/domain/entities/product_entity.dart';
import 'package:shopapp/features/products/domain/repositories/product_repository.dart';

class AddProductUsecase {
  final ProductRepository productRepository;

  AddProductUsecase({
    required this.productRepository,
  });

  Future<void> call(ProductEntity product) async{
    await productRepository.add_product(product);
  }
}