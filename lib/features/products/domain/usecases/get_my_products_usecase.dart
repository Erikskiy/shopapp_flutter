import 'package:shopapp/features/products/domain/entities/product_entity.dart';
import 'package:shopapp/features/products/domain/repositories/product_repository.dart';

class GetMyProductsUsecase {
  final ProductRepository productRepository;

  GetMyProductsUsecase({
    required this.productRepository,
  });

  Future<List<ProductEntity>> call() async{
    return await productRepository.getMyProducts();
  }
}