import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class MyAccountMenuButton extends StatelessWidget{
  final String buttonName;
  final VoidCallback onTap;
  final IconData buttonIcon;

  MyAccountMenuButton({
    required this.buttonName,
    required this.onTap,
    required this.buttonIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [

          Icon(
            buttonIcon,
            size: AppSizes.icon28,
          ),

          SizedBox(
            width: AppSizes.p8,
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  buttonName,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: AppSizes.textDefaultSize,
                  ),
                ),

                Icon(
                  Icons.keyboard_arrow_right,
                  size: AppSizes.icon40,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}