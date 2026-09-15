import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/account/presentation/cubit/account_cubit.dart';
import 'package:shopapp/features/account/presentation/cubit/account_state.dart';
import 'package:shopapp/features/account/presentation/widgets/my_profile_appbar.dart';
import 'package:shopapp/features/account/presentation/widgets/my_profile_edit_photo_iconbutton.dart';
import 'package:shopapp/features/account/presentation/widgets/my_profile_edit_textfield.dart';
import 'package:shopapp/features/account/presentation/widgets/my_profile_edit_textbutton.dart';

class MyProfileEditScreen extends StatefulWidget{
  const MyProfileEditScreen({super.key});
  @override
  State<MyProfileEditScreen> createState() => _MyProfileEditScreenState();
}


class _MyProfileEditScreenState extends State<MyProfileEditScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String avatarUrl = "";

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AccountCubit>().state;
    if(state is AccountLoaded){
      nameController.text = state.currentUserEntity.name;
      emailController.text = state.currentUserEntity.email;
      avatarUrl = state.currentUserEntity.avatarUrl;
    }

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
                    prefixIcon: Icons.drive_file_rename_outline,
                    controller: nameController,
                    readOnly: false,
                    suffixIcon: null,
                  ),

                  SizedBox(height: AppSizes.p16,),

                  MyProfileEditTextfield(
                    prefixIcon: Icons.email,
                    controller: emailController,
                    readOnly: true,
                    suffixIcon: Icons.lock,
                  ),

                ],
              ),

              MyProfileEditTextbutton(
                text: "Save",
                onPressed: () async{
                  await context.read<AccountCubit>().editProfile(nameController.text, avatarUrl);
                  context.pop();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}