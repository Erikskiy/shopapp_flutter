import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class CheckoutPayButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;

  CheckoutPayButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            Icons.lock,
            size: AppSizes.icon24,
            color: Colors.white,
          ),

          SizedBox(width: AppSizes.p8,),

          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: AppSizes.textDefaultSize,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(width: AppSizes.p8,),

          Icon(
            Icons.keyboard_arrow_right,
            size: AppSizes.icon28,
            color: Colors.white,
          ),

        ],
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.black),
        fixedSize: WidgetStatePropertyAll(Size(484, 60)),
      ),
    );
  }
}