import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class MyProfileEditTextfield extends StatelessWidget{
  final TextEditingController controller;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool readOnly;

  const MyProfileEditTextfield({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: AppSizes.textDefaultSize,
      ),
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          size: AppSizes.icon28,
        ),
        suffixIcon: suffixIcon != null ? Icon(
          suffixIcon,
          size: AppSizes.icon28,
        ): null,
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
        filled: true,
        fillColor: Colors.black12,
      ),
    );
  }
}