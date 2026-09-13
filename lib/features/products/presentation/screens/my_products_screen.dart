import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/core/router/app_routes.dart';
import 'package:shopapp/features/products/domain/entities/product_entity.dart';
import 'package:shopapp/features/products/presentation/widgets/products_textbutton.dart';
import 'package:shopapp/features/products/presentation/widgets/my_products_card_container.dart';
import 'package:shopapp/features/products/presentation/widgets/my_products_count_icon.dart';

class MyProductsScreen extends StatelessWidget{
  final ProductEntity product = ProductEntity(
    id: "11111",
    name: "Nike Hoodie",
    description: "",
    price: 500,
    imageUrl: "",
    category: "",
    sizes: [],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            top: AppSizes.paddingScreen,
            left: AppSizes.paddingScreen,
            right: AppSizes.paddingScreen,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [

                  MyProductsCountIcon(
                    myProductsCount: 1,
                  ),

                  SizedBox(height: AppSizes.p32,),

                  MyProductsCardContainer(
                    product: product,
                    productCurrency: "\$",
                    onImageTap: (){
                      context.push(AppRoutes.productDetailsScreen);
                    },
                    onEditTap: (){
                      context.push(AppRoutes.addProductScreen);
                    },
                    onDeleteTap: (){},
                  ),

                ],
              ),

              Padding(
                padding: EdgeInsetsGeometry.only(
                  bottom: AppSizes.p8,
                ),
                child: ProductsTextbutton(
                  text: "Add Product",
                  onPressed: (){ context.push(AppRoutes.addProductScreen); },
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}