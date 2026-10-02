import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class AddProductCategorySinglechildscrollview extends StatelessWidget {
  TextEditingController productCategoryController;

  AddProductCategorySinglechildscrollview({
    super.key,
    required this.productCategoryController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          _categoryButton("Dresses", () {
            productCategoryController.text = "Dresses";
          },),
          SizedBox(width: AppSizes.p12),

          _categoryButton("Jackets", () {
            productCategoryController.text = "Jackets";
          },),
          SizedBox(width: AppSizes.p12),

          _categoryButton("Jeans", () {
            productCategoryController.text = "Jeans";
          },),
          SizedBox(width: AppSizes.p12),

          _categoryButton("T-Shirts", () {
            productCategoryController.text = "T-Shirts";
          },),
          SizedBox(width: AppSizes.p12),

          _categoryButton("Hoodies", () {
            productCategoryController.text = "Hoodies";
          },),
          SizedBox(width: AppSizes.p12),

          _categoryButton("Pants", () {
            productCategoryController.text = "Pants";
          },),
          SizedBox(width: AppSizes.p12),

          _categoryButton("Shoes", () {
            productCategoryController.text = "Shoes";
          },),
          SizedBox(width: AppSizes.p12),

          _categoryButton("Accessories", () {
            productCategoryController.text = "Accessories";
          },),

        ],
      ),
    );
  }

  Widget _categoryButton(String category, VoidCallback onPressed) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(AppSizes.textfieldRadius_24),
        ),
        color: Colors.black12,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          category,
          style: TextStyle(
            fontSize: AppSizes.textSmallSize,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}