import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

AppBar myAccountAppbar(String text){
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
  );
}