import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class ProductsSizesSinglechildscrollview extends StatelessWidget {
  final List<String> selectedSizes;
  final Function(String) onSizeTap;

  const ProductsSizesSinglechildscrollview({
    super.key,
    required this.selectedSizes,
    required this.onSizeTap,
  });

  @override
  Widget build(BuildContext context) {

    final List<String> sizes = [
      "XS",
      "S",
      "M",
      "L",
      "XL",
      "XXL",
      "XXXL",
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: sizes.map((size) {

          final bool isSelected = selectedSizes.contains(size);

          return Padding(
            padding: EdgeInsets.only(
              right: AppSizes.p12,
            ),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    AppSizes.textfieldRadius_24,
                  ),
                ),
                color: isSelected
                    ? Colors.black
                    : Colors.black12,
              ),
              child: TextButton(
                onPressed: () {
                  onSizeTap(size);
                },
                child: Text(
                  size,
                  style: TextStyle(
                    fontSize: AppSizes.textSmallSize,
                    color: isSelected
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}