import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shopapp/features/products/domain/entities/product_entity.dart';
import 'package:shopapp/features/products/presentation/cubit/product_cubit.dart';
import 'package:shopapp/features/products/presentation/widgets/add_product_addproduct_textbutton.dart';
import 'package:shopapp/features/products/presentation/widgets/add_product_appbar.dart';
import 'package:shopapp/features/products/presentation/widgets/add_product_category_singlechildscrollview.dart';
import 'package:shopapp/features/products/presentation/widgets/add_product_fieldtitle_text.dart';
import 'package:shopapp/features/products/presentation/widgets/add_product_textfield.dart';
import 'package:shopapp/features/products/presentation/widgets/products_sizes_singlechildscrollview.dart';

class AddProductScreen extends StatefulWidget{
  const AddProductScreen({super.key});
  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();

  List<String> selectedSizes = [];

  final ImagePicker imagePicker = ImagePicker();
  File? selectedImage;
  Future<void> pickImage() async {
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) return;
    if (!mounted) return;
    setState(() {
      selectedImage = File(image.path);
    });
  }

  @override
  void dispose() {
    productNameController.dispose();
    productDescriptionController.dispose();
    productPriceController.dispose();
    productCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  child: selectedImage == null
                      ? IconButton(
                    onPressed: () {
                      pickImage();
                    },
                    icon: Icon(
                      Icons.add_photo_alternate_outlined,
                      size: AppSizes.icon300,
                    ),
                  )
                      : GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppSizes.textfieldRadius_24,
                      ),
                      child: Image.file(
                        selectedImage!,
                        width: AppSizes.imageSize,
                        height: AppSizes.imageSize,
                        fit: BoxFit.cover,
                      ),
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

                AddProductCategorySinglechildscrollview(
                  productCategoryController: productCategoryController,
                ),

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

                ProductsSizesSinglechildscrollview(
                  onSizeTap: (size) {
                    setState(() {
                      if (selectedSizes.contains(size)) {
                        selectedSizes.remove(size);
                      } else {
                        selectedSizes.add(size);
                      }
                    });
                  },
                  selectedSizes: selectedSizes,
                ),

                SizedBox(height: AppSizes.p36,),

                AddProductAddproductTextbutton(
                  text: "Add Product",
                  onPressed: () async{
                    final productCubit = context.read<ProductCubit>();
                    if (selectedImage == null) {return;}
                    final String imageUrl = await productCubit.uploadProductImage(selectedImage!,);

                    final double? price = double.tryParse(productPriceController.text,);
                    if (price == null) {return;}

                    final String ownerId = context.read<AuthCubit>().getCurrentUser();

                    final ProductEntity product = ProductEntity(
                      ownerId: ownerId,
                      name: productNameController.text,
                      description: productDescriptionController.text,
                      price: price,
                      imageUrl: imageUrl,
                      category: productCategoryController.text,
                      sizes: selectedSizes,
                    );

                    await context.read<ProductCubit>().add_product(product);
                    context.pop();
                  },
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