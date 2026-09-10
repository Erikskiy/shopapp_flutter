import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class MyProductsCountIcon extends StatelessWidget {
  final int myProductsCount;

  const MyProductsCountIcon({
    super.key,
    required this.myProductsCount,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.p12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppSizes.textfieldRadius_24,
          ),
          color: Colors.black12,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_bag,
              size: AppSizes.icon32,
              color: Colors.black,
            ),

            const SizedBox(
              width: AppSizes.p4,
            ),

            Text(
              myProductsCount.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: AppSizes.textDefaultSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}