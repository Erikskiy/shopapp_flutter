import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class MyProfileEditPhotoIconbutton extends StatelessWidget{
  final VoidCallback onIconTap;

  const MyProfileEditPhotoIconbutton({super.key,
    required this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentGeometry.bottomCenter,
        child: Stack(
          children: [

            SizedBox(
              height: AppSizes.icon300,
              width: AppSizes.icon300,
              child: ColoredBox(
                color: Colors.black12,
              ),
            ),

            Positioned(
              height: 300,
              width: 300,
              child: IconButton(
                onPressed: onIconTap,
                icon: Icon(
                  Icons.photo_camera,
                  size: AppSizes.icon80,
                  color: Colors.black,
                ),
              ),
            )

          ],
        )
    );
  }
}