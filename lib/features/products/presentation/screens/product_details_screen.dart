import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/products/presentation/widgets/products_textbutton.dart';
import 'package:shopapp/features/products/presentation/widgets/product_details_appbar.dart';
import 'package:shopapp/features/products/presentation/widgets/products_sizes_singlechildscrollview.dart';

class ProductDetailsScreen extends StatelessWidget{
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProductDetailsAppbar(
        "Product",
          () => context.pop(),
          (){},
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(AppSizes.paddingScreen,),
          child: Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [

                          SizedBox(
                            height: AppSizes.imageSize,
                            width: AppSizes.imageSize,
                            child: ColoredBox(
                              color: Colors.black12,
                            ),
                          ),

                          SizedBox(height: AppSizes.p4,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Expanded(
                                child: Text(
                                  "Nike Hoodie",
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: AppSizes.textSmallTitleSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Text(
                                "500.0\$",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: AppSizes.textSmallTitleSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ],
                          ),

                          SizedBox(height: AppSizes.p12,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text(
                                "Select Size",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppSizes.textDefaultSize,
                                ),
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

                          //ProductsSizesSinglechildscrollview(),

                          SizedBox(height: AppSizes.p16,),

                          Align(
                            alignment: AlignmentGeometry.bottomLeft,
                            child: Text(
                              "Description",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: AppSizes.textDefaultSize,
                              ),
                            ),
                          ),

                          SizedBox(height: AppSizes.p4,),

                          Text(
                            "Aaaaaaaaaa aaaa aaaaaaa aaaaa aaaa aaaaaaaaaaa aaa aaaaa aaaaaaaa aaaaaaaa aaaaaaaaaaa aaaaaaaa aaaaaaaaaa aaa aaaaaaaa a aaaaaaa aaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: AppSizes.textDefaultSize,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  ProductsTextbutton(
                    onPressed: (){},
                    text: "Add To Cart",
                  ),

                ],
              )
          ),
        ),
      ),
    );
  }
}