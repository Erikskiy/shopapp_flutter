import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class HomeSearchTextfield extends StatelessWidget{
  final TextEditingController searchController;

  HomeSearchTextfield({
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      style: TextStyle(
        fontSize: AppSizes.textDefaultSize,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSizes.textfieldRadius_24)),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.textfieldRadius_24),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.textfieldRadius_24),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.textfieldRadius_24),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        prefixIcon: Icon(
          Icons.search,
          size: AppSizes.icon32,
        ),
        filled: true,
        fillColor: Colors.black12,
      ),
    );
  }
}