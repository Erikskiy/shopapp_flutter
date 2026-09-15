import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class MyProfileEditPhotoIconbutton extends StatelessWidget{
  final VoidCallback onIconTap;
  final String avatarUrl;

  const MyProfileEditPhotoIconbutton({super.key,
    required this.onIconTap,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentGeometry.bottomCenter,
        child: Stack(
          children: [

            CircleAvatar(
              radius: AppSizes.icon150,
              backgroundColor: Colors.black12,
              backgroundImage: avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
              child: avatarUrl.isNotEmpty ? null : Icon(
                Icons.person_rounded,
                size: AppSizes.icon80,
                color: Colors.black,
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