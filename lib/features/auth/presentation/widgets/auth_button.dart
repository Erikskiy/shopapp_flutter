import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class AuthButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;

  AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: AppSizes.textDefaultSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.black),
        fixedSize: WidgetStatePropertyAll(Size(484, 60)),
      ),
    );
  }
}