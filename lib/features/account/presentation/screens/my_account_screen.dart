import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/core/router/app_routes.dart';
import 'package:shopapp/features/account/presentation/cubit/account_cubit.dart';
import 'package:shopapp/features/account/presentation/cubit/account_state.dart';
import 'package:shopapp/features/account/presentation/widgets/my_account_appbar.dart';
import 'package:shopapp/features/account/presentation/widgets/my_account_menu_button.dart';
import 'package:shopapp/features/auth/presentation/cubit/auth_cubit.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AccountCubit>().state;
    String name = "User";
    String avatarUrl = "";
    if(state is AccountLoaded){
      name = state.currentUserEntity.name;
      avatarUrl = state.currentUserEntity.avatarUrl;
    }

    return Scaffold(
      appBar: myAccountAppbar("My Account"),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.only(
            right: AppSizes.paddingScreen,
            left: AppSizes.paddingScreen,
            top: AppSizes.paddingScreen,
          ),
          child: Column(
            children: [
              Align(
                alignment: AlignmentGeometry.bottomCenter,
                child: CircleAvatar(
                  radius: AppSizes.icon80,
                  backgroundColor: Colors.black12,
                  backgroundImage: avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
                  child: avatarUrl.isNotEmpty ? null : Icon(
                    Icons.person_rounded,
                    size: AppSizes.icon80,
                    color: Colors.black,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: AppSizes.textSmallTitleSize,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      context.push(AppRoutes.myProfileEditScreen);
                    },
                    icon: Icon(
                      Icons.edit,
                      size: AppSizes.icon32,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSizes.p16),

              MyAccountMenuButton(
                buttonIcon: Icons.settings,
                buttonName: "Settings",
                onTap: () {
                  context.push(AppRoutes.settingsScreen);
                },
              ),

              MyAccountMenuButton(
                buttonIcon: Icons.place,
                buttonName: "Shipping Address",
                onTap: () {
                  context.push(AppRoutes.shippingAddressScreen);
                },
              ),

              MyAccountMenuButton(
                buttonIcon: Icons.payment,
                buttonName: "Payment Settings",
                onTap: () {
                  context.push(AppRoutes.paymentSettings);
                },
              ),

              MyAccountMenuButton(
                buttonIcon: Icons.privacy_tip,
                buttonName: "Privacy Policy",
                onTap: () {},
              ),

              MyAccountMenuButton(
                buttonIcon: Icons.logout,
                buttonName: "Log Out",
                onTap: () async {
                  await context.read<AuthCubit>().logout();
                  context.go(AppRoutes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
