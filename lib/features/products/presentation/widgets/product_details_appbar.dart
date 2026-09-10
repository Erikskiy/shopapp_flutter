import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

AppBar ProductDetailsAppbar(String title, VoidCallback onBackIconTap, VoidCallback onfavoriteIconTap,){
  return AppBar(
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: AppSizes.textSmallTitleSize,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed:onBackIconTap,
      icon: Icon(
        Icons.arrow_back,
        size: AppSizes.icon36,
        color: Colors.black,
      ),
    ),
    actions: [

      IconButton(
        onPressed: onfavoriteIconTap,
        icon: Icon(
          Icons.favorite,
          size: AppSizes.icon36,
          color: Colors.black,
        ),
      ),

      SizedBox(width: AppSizes.paddingScreen,)

    ],
  );
}