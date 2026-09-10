import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class CheckoutTextfield extends StatelessWidget{
  final String name;
  final TextEditingController controller;
  final IconData prefixIcon;

  const CheckoutTextfield({
    super.key,
    required this.name,
    required this.controller,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Align(
          alignment: AlignmentGeometry.bottomLeft,
          child: Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: AppSizes.textDefaultSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        SizedBox(height: AppSizes.p4,),

        TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(
              prefixIcon,
              size: AppSizes.icon24,
            ),
            filled: true,
            fillColor: Colors.black12,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.textfieldRadius_24)),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.textfieldRadius_24),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.textfieldRadius_24),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.textfieldRadius_24),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),

      ],
    );
  }
}