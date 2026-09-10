import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class AddProductTextfield extends StatelessWidget{
  final TextEditingController controller;
  final IconData prefixIcon;
  final int minLines;
  final int maxLines;

  const AddProductTextfield({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.minLines,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
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
        prefixIcon: Icon(
          prefixIcon,
          size: AppSizes.icon24,
        ),
        filled: true,
        fillColor: Colors.black12,
      ),
    );
  }
}