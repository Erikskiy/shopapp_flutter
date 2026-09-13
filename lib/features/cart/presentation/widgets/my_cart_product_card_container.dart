import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/products/domain/entities/product_entity.dart';

class MyCartProductCardContainer extends StatelessWidget {
  final ProductEntity product;
  final String productCurrency;
  final VoidCallback onImageTap;
  final VoidCallback onFavoriteTap;

  final bool isSelected;
  final ValueChanged<bool?> onSelectedChanged;

  const MyCartProductCardContainer({
    super.key,
    required this.product,
    required this.productCurrency,
    required this.onImageTap,
    required this.onFavoriteTap,
    required this.isSelected,
    required this.onSelectedChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            value: isSelected,
            onChanged: onSelectedChanged,
          ),
        ),

        const SizedBox(width: AppSizes.p4),

        Expanded(
          child: Container(
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
                    child: Container(
                      color: Colors.grey.shade300,
                      child: product.imageUrl.isNotEmpty
                          ? Image.network(
                        product.imageUrl,
                        fit: BoxFit.fill,
                      )
                          : const Icon(
                        Icons.image,
                        size: AppSizes.icon150,
                      ),
                    ),
                  ),
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
                          "${product.price}$productCurrency",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: AppSizes.textDefaultSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: onFavoriteTap,
                                icon: Icon(
                                  Icons.favorite,
                                  size: AppSizes.icon32,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}