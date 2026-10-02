import 'package:shopapp/features/products/domain/entities/product_entity.dart';

abstract class ProductState {}

class ProductInitial extends ProductState{}

class ProductLoading extends ProductState{}

class ProductSuccess extends ProductState{}

class ProductError extends ProductState{
  final String error;

  ProductError({
    required this.error,
  });
}

class ProductLoaded extends ProductState{
  final List<ProductEntity> products;

  ProductLoaded({
    required this.products,
  });
}