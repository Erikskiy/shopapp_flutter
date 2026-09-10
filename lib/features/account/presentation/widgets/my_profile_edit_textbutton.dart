import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class MyProfileEditTextbutton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;

  MyProfileEditTextbutton({
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
        ),
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          Colors.black,
        ),
        fixedSize: WidgetStatePropertyAll(Size(484, 60)),
      ),
    );
  }
}