import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class FavoritesCountIcon extends StatelessWidget {
  final int favoriteCount;

  const FavoritesCountIcon({
    super.key,
    required this.favoriteCount,
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
              Icons.favorite,
              size: AppSizes.icon32,
              color: Colors.black,
            ),

            const SizedBox(
              width: AppSizes.p4,
            ),

            Text(
              favoriteCount.toString(),
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