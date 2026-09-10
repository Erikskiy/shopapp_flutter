import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

AppBar settingsAppbar(String title, VoidCallback onBackIconTap,){
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(
        fontSize: AppSizes.textSmallTitleSize,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    leading: IconButton(
      onPressed:onBackIconTap,
      icon: Icon(
        Icons.arrow_back,
        size: AppSizes.icon36,
        color: Colors.black,
      ),
    ),
  );
}