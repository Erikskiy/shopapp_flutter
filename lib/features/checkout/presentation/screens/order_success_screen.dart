import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/core/router/app_routes.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_button.dart';

class OrderSuccessScreen extends StatelessWidget{
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.paddingScreen,),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SizedBox(height: AppSizes.p4,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      Icons.task_alt_outlined,
                      size: AppSizes.icon150,
                      color: Colors.black,
                    ),

                    Text(
                      "Order Confirmed!",
                      style: TextStyle(
                        fontSize: AppSizes.textSmallTitleSize,
                        color: Colors.black,
                      ),
                    ),

                    SizedBox(height: AppSizes.p12,),

                    Text(
                      "Your order has been placed successfully.",
                      style: TextStyle(
                        fontSize: AppSizes.textDefaultSize,
                        color: Colors.black,
                      ),
                    ),

                    Text(
                      "It will be delivered soon.",
                      style: TextStyle(
                        fontSize: AppSizes.textDefaultSize,
                        color: Colors.black,
                      ),
                    ),

                  ],
                ),

                CheckoutButton(
                  text: "Continue Shopping",
                  onPressed: (){
                    context.push(AppRoutes.myCartScreen);
                  },
                ),

              ],
            )
          ),
        ),
      ),
    );
  }
}