import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

AppBar addProductAppbar(String text, VoidCallback onBackIconTap){
  return AppBar(
    centerTitle: true,
    title: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: AppSizes.textSmallTitleSize,
        fontWeight: FontWeight.bold,
      ),
    ),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        size: AppSizes.icon36,
      ),
      onPressed: onBackIconTap,
    ),
  );
}