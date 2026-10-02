import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/core/router/app_routes.dart';
import 'package:shopapp/features/favorites/presentation/widgets/favorites_count_icon.dart';
import 'package:shopapp/features/favorites/presentation/widgets/favorite_product_card_container.dart';
import 'package:shopapp/features/products/domain/entities/product_entity.dart';

class FavoritesScreen extends StatelessWidget{
  final ProductEntity product = ProductEntity(
    ownerId: "1111",
    name: "Nike Hoodie",
    description: "",
    price: 500,
    imageUrl: "",
    category: "",
    sizes: [],
  );

  FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(top: AppSizes.paddingScreen, left: AppSizes.paddingScreen, right: AppSizes.paddingScreen,),
          child: Column(
            children: [

              FavoritesCountIcon(
                favoriteCount: 1,
              ),

              SizedBox(height: AppSizes.p32,),

              FavoriteProductCardContainer(
                product: product,
                productCurrency: "\$",
                onAddToCart: (){},
                onFavoriteTap: (){},
                onImageTap: (){
                  context.push(AppRoutes.productDetailsScreen);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}