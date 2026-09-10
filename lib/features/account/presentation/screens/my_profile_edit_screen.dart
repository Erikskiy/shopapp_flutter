import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/account/presentation/widgets/my_profile_appbar.dart';
import 'package:shopapp/features/account/presentation/widgets/my_profile_edit_photo_iconbutton.dart';
import 'package:shopapp/features/account/presentation/widgets/my_profile_edit_textfield.dart';
import 'package:shopapp/features/account/presentation/widgets/my_profile_edit_textbutton.dart';

class MyProfileEditScreen extends StatelessWidget{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  MyProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myProfile(
        "Edit Profile",
            () {
          context.pop();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(AppSizes.paddingScreen),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [

                  MyProfileEditPhotoIconbutton(
                    onIconTap: (){},
                  ),

                  SizedBox(height: AppSizes.p16,),

                  MyProfileEditTextfield(
                    icon: Icons.drive_file_rename_outline,
                    controller: nameController,
                  ),

                  SizedBox(height: AppSizes.p16,),

                  MyProfileEditTextfield(
                    icon: Icons.email,
                    controller: emailController,
                  ),

                ],
              ),

              MyProfileEditTextbutton(
                text: "Save",
                onPressed: (){},
              ),

            ],
          ),
        ),
      ),
    );
  }
}