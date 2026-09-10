import 'package:flutter/material.dart';
import 'package:icon_plus/icon_plus.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class AuthGoogleSignInButton extends StatelessWidget{
  final String text;
  final VoidCallback onPressed;

  AuthGoogleSignInButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Brand(
            Brands.google,
            size: AppSizes.icon32,
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

        ],
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.black),
        fixedSize: WidgetStatePropertyAll(Size(484, 60)),
      ),
    );
  }
}