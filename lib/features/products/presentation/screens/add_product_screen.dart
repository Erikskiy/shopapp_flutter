import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/products/presentation/widgets/add_product_addproduct_textbutton.dart';
import 'package:shopapp/features/products/presentation/widgets/add_product_appbar.dart';
import 'package:shopapp/features/products/presentation/widgets/add_product_category_singlechildscrollview.dart';
import 'package:shopapp/features/products/presentation/widgets/add_product_fieldtitle_text.dart';
import 'package:shopapp/features/products/presentation/widgets/add_product_textfield.dart';
import 'package:shopapp/features/products/presentation/widgets/products_sizes_singlechildscrollview.dart';

class AddProductScreen extends StatelessWidget{
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController productNameController = TextEditingController();
    TextEditingController productDescriptionController = TextEditingController();
    TextEditingController productPriceController = TextEditingController();

    return Scaffold(
      appBar: addProductAppbar(
        "Add product",
        () {
          context.pop();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsetsGeometry.only(
              left: AppSizes.paddingScreen,
              right: AppSizes.paddingScreen,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(
                  width: AppSizes.imageSize,
                  height: AppSizes.imageSize,
                  child: IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.add_photo_alternate_outlined,
                      size: AppSizes.icon300,
                    ),
                  ),
                ),

                Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: AddProductFieldtitleText(
                    fieldTitle: "Name",
                  ),
                ),

                SizedBox(height: AppSizes.p4,),

                AddProductTextfield(
                  controller: productNameController,
                  prefixIcon: Icons.title,
                  minLines: 1,
                  maxLines: 1,
                ),

                SizedBox(height: AppSizes.p12,),

                Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: AddProductFieldtitleText(
                      fieldTitle: "Description",
                    ),
                ),

                SizedBox(height: AppSizes.p4,),

                AddProductTextfield(
                  controller: productDescriptionController,
                  prefixIcon: Icons.description,
                  minLines: 4,
                  maxLines: 10,
                ),

                SizedBox(height: AppSizes.p12,),

                Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: AddProductFieldtitleText(
                    fieldTitle: "Price",
                  ),
                ),

                SizedBox(height: AppSizes.p4,),

                AddProductTextfield(
                  controller: productPriceController,
                  prefixIcon: Icons.price_change,
                  minLines: 1,
                  maxLines: 1,
                ),

                SizedBox(height: AppSizes.p12,),

                Align(
                  alignment: AlignmentGeometry.topLeft,
                  child: AddProductFieldtitleText(
                    fieldTitle: "Category",
                  ),
                ),

                SizedBox(height: AppSizes.p4,),

                AddProductCategorySinglechildscrollview(),

                SizedBox(height: AppSizes.p12,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    AddProductFieldtitleText(
                      fieldTitle: "Sizes",
                    ),

                    Text(
                      "Size Chart",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: AppSizes.textDefaultSize,
                      ),
                    ),

                  ],
                ),

                SizedBox(height: AppSizes.p4,),

                ProductsSizesSinglechildscrollview(),

                SizedBox(height: AppSizes.p36,),

                AddProductAddproductTextbutton(
                  text: "Add Product",
                  onPressed: (){},
                ),

                SizedBox(height: AppSizes.p32,),

              ],
            ),
          ),
        )
      ),
    );
  }
}