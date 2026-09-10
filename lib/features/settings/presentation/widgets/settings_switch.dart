import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class SettingsSwitch extends StatelessWidget{
  final IconData iconData;
  final String name;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsSwitch({
    super.key,
    required this.iconData,
    required this.name,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Row(
          children: [

            Icon(
              iconData,
              size: AppSizes.icon28,
            ),

            SizedBox(
              width: AppSizes.p8,
            ),

            Text(
              name,
              style: TextStyle(
                fontSize: AppSizes.textDefaultSize,
                color: Colors.black,
              ),
            ),

          ],
        ),

        Switch(
          value: value,
          onChanged: onChanged,
        ),

      ],
    );
  }
}