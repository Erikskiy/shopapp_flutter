import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/core/router/app_routes.dart';
import 'package:shopapp/features/products/presentation/cubit/product_cubit.dart';
import 'package:shopapp/features/products/presentation/cubit/product_state.dart';
import 'package:shopapp/features/products/presentation/widgets/products_textbutton.dart';
import 'package:shopapp/features/products/presentation/widgets/my_products_card_container.dart';
import 'package:shopapp/features/products/presentation/widgets/my_products_count_icon.dart';
class MyProductsScreen extends StatelessWidget {
  const MyProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: AppSizes.paddingScreen,
            left: AppSizes.paddingScreen,
            right: AppSizes.paddingScreen,
          ),
          child: Column(
            children: [

              Expanded(
                child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {

                    if (state is ProductLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (state is ProductLoaded) {
                      final products = state.products;

                      return Column(
                        children: [

                          MyProductsCountIcon(
                            myProductsCount: products.length,
                          ),

                          SizedBox(height: AppSizes.p32),

                          Expanded(
                            child: ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (context, index) {

                                final product = products[index];

                                return MyProductsCardContainer(
                                  product: product,
                                  productCurrency: "\$",
                                  onImageTap: () {
                                    context.push(
                                      AppRoutes.productDetailsScreen,
                                    );
                                  },
                                  onEditTap: () {
                                    context.push(
                                      AppRoutes.addProductScreen,
                                    );
                                  },
                                  onDeleteTap: () {},
                                );
                              },
                            ),
                          ),

                        ],
                      );
                    }

                    if (state is ProductError) {
                      return Center(
                        child: Text(state.error),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  bottom: AppSizes.p8,
                ),
                child: ProductsTextbutton(
                  text: "Add Product",
                  onPressed: () {
                    context.push(AppRoutes.addProductScreen);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}