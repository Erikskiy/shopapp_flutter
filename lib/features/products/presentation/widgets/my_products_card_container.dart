import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/products/domain/entities/product_entity.dart';

class MyProductsCardContainer extends StatelessWidget{
  final ProductEntity product;
  final String productCurrency;
  final VoidCallback onImageTap;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;

  const MyProductsCardContainer({super.key,
    required this.product,
    required this.productCurrency,
    required this.onImageTap,
    required this.onEditTap,
    required this.onDeleteTap,
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
              child: Image.network(
                product.imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const ColoredBox(
                    color: Colors.black12,
                    child: Center(
                      child: Icon(
                        Icons.broken_image_outlined,
                      ),
                    ),
                  );
                },
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
                      fontSize: AppSizes.textSmallTitleSize,
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [

                          IconButton(
                            onPressed: onEditTap,
                            icon: Icon(
                              Icons.edit,
                              size: AppSizes.icon32,
                              color: Colors.black,
                            ),
                          ),

                          IconButton(
                            onPressed: onDeleteTap,
                            icon: Icon(
                              Icons.delete,
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