import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class AuthTextfield extends StatelessWidget{
  final String textfieldName;
  final TextEditingController controller;
  final IconData prefixIcon;

  const AuthTextfield({
    super.key,
    required this.textfieldName,
    required this.controller,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              textfieldName,
              style: TextStyle(
                color: Colors.black,
                fontSize: AppSizes.textDefaultSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        TextField(
          controller: controller,
          style: TextStyle(
            fontSize: AppSizes.textDefaultSize,
          ),
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