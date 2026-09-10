import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class AddProductFieldtitleText extends StatelessWidget{
  final String fieldTitle;

  const AddProductFieldtitleText({
    super.key,
    required this.fieldTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      fieldTitle,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: AppSizes.textDefaultSize,
      ),
    );
  }
}