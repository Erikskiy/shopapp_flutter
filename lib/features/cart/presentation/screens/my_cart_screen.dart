import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/core/router/app_routes.dart';
import 'package:shopapp/features/cart/presentation/widgets/my_cart_buy_textbutton.dart';
import 'package:shopapp/features/cart/presentation/widgets/my_cart_count_icon.dart';
import 'package:shopapp/features/cart/presentation/widgets/my_cart_product_card_container.dart';
import 'package:shopapp/features/products/domain/product_entity.dart';

class MyCartScreen extends StatefulWidget{
  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  final ProductEntity product = ProductEntity(
    id: "11111",
    name: "Nike Hoodie",
    description: "",
    price: 500,
    imageUrl: "",
    category: "",
    sizes: [],
  );

  late bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(AppSizes.paddingScreen),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [

                  MyCartCountIcon(
                    count: 1,
                  ),

                  SizedBox(height: AppSizes.p32,),

                  MyCartProductCardContainer(
                    product: product,
                    productCurrency: "\$",
                    onFavoriteTap: (){},
                    isSelected: isSelected,
                    onSelectedChanged: (value) {
                      setState(() {
                        isSelected = value ?? false;
                      });
                    },
                    onImageTap: (){
                      context.push(AppRoutes.productDetailsScreen);
                    },
                  ),

                ],
              ),

              MyCartBuyTextbutton(
                text: "Buy",
                onPressed: (){
                  context.push(AppRoutes.checkoutScreen);
                },
              ),
            ],

          )
        ),
      ),
    );
  }
}