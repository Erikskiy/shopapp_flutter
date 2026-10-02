import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/features/products/domain/entities/product_entity.dart';
import 'package:shopapp/features/products/domain/usecases/add_product_usecase.dart';
import 'package:shopapp/features/products/domain/usecases/get_my_products_usecase.dart';
import 'package:shopapp/features/products/domain/usecases/upload_product_image_usecase.dart';
import 'package:shopapp/features/products/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState>{
  final AddProductUsecase addProductUsecase;
  final UploadProductImageUsecase uploadProductImageUsecase;
  final GetMyProductsUsecase getMyProductsUsecase;

  ProductCubit({
    required this.addProductUsecase,
    required this.uploadProductImageUsecase,
    required this.getMyProductsUsecase,
  }):super(ProductInitial());


  Future<void> add_product(ProductEntity product) async{
    try{
      emit(ProductLoading());

      await addProductUsecase.call(product);

      await getMyProducts();
    } catch(e){
      emit(ProductError(error: e.toString()));
    }
  }

  Future<String> uploadProductImage(File image) async{
    try{
      return await uploadProductImageUsecase.call(image);
    } catch(e){
      emit(ProductError(error: e.toString()));
      rethrow;
    }
  }

  Future<void> getMyProducts() async {
    try {
      emit(ProductLoading());

      final products = await getMyProductsUsecase.call();

      emit(ProductLoaded(products: products));
    } catch (e) {
      emit(ProductError(error: e.toString()));
    }
  }


}