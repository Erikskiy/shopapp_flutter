import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/products/domain/product_entity.dart';

class FavoriteProductCardContainer extends StatelessWidget {
  final ProductEntity product;
  final String productCurrency;
  final VoidCallback onImageTap;
  final VoidCallback onFavoriteTap;
  final VoidCallback onAddToCart;

  const FavoriteProductCardContainer({
    super.key,
    required this.product,
    required this.productCurrency,
    required this.onImageTap,
    required this.onFavoriteTap,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          AppSizes.textfieldRadius_24,
        ),
        border: Border.all(
          color: Colors.black,
          width: 1.5,
        ),
      ),
      child: Row(
        children: [

          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: onImageTap,
              child: ColoredBox(
                color: Colors.black12,
                child: SizedBox.expand(),
              ),
            )
          ),

          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.p12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    product.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppSizes.textDefaultSize,
                    ),
                  ),

                  const SizedBox(height: AppSizes.p8),

                  Text(
                    "${product.price.toString()}$productCurrency",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: AppSizes.textDefaultSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        TextButton(
                          onPressed: onAddToCart,
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.p12,
                              vertical: AppSizes.p4,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSizes.textfieldRadius_24,
                              ),
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                            ),
                          ),
                          child: Text(
                            "Add To Cart ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: AppSizes.textDefaultSize,
                            ),
                          ),
                        ),

                        IconButton(
                          onPressed: onFavoriteTap,
                          icon: Icon(
                            Icons.favorite,
                            size: AppSizes.icon32,
                            color: Colors.black,
                          ),
                        ),

                      ],

                    )
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}