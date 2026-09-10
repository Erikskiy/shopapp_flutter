import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class AuthFooterText extends StatelessWidget{
  final String questionText;
  final String buttonText;
  final VoidCallback onPressed;

  const AuthFooterText({
    super.key,
    required this.questionText,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          questionText,
          style: TextStyle(
            color: Colors.grey,
            fontSize: AppSizes.textDefaultSize,
            fontWeight: FontWeight.bold,
          ),
        ),

        TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.black,
              fontSize: AppSizes.textDefaultSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

      ],
    );
  }
}