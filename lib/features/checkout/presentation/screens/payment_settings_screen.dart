import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_appbar.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_button.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_paymentmethod_iconbuttons.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_textfield.dart';

class PaymentSettingsScreen extends StatelessWidget{
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardDateController = TextEditingController();
  final TextEditingController cardCVVController = TextEditingController();
  final TextEditingController cardNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: checkoutAppbar(
        "Payment Settings",
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

                  Align(
                    alignment: AlignmentGeometry.bottomLeft,
                    child: Text(
                      "Payment Method",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: AppSizes.textDefaultSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  CheckoutPaymentmethodIconbuttons(
                    onCardTap: (){},
                    onWalletTap: (){},
                  ),

                  SizedBox(height: AppSizes.p16,),

                  CheckoutTextfield(
                    name: "Card Number",
                    controller: cardNumberController,
                    prefixIcon: Icons.phone,
                  ),

                  SizedBox(height: AppSizes.p16,),

                  Row(
                    children: [

                      Expanded(
                        child: CheckoutTextfield(
                          name: "Expiry Date",
                          controller: cardDateController,
                          prefixIcon: Icons.date_range,
                        ),
                      ),

                      SizedBox(width: AppSizes.p8,),

                      Expanded(
                        child: CheckoutTextfield(
                          name: "CVV",
                          controller: cardCVVController,
                          prefixIcon: Icons.lock,
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: AppSizes.p16,),

                  CheckoutTextfield(
                    name: "Name on Card",
                    controller: cardNameController,
                    prefixIcon: Icons.person,
                  ),

                ],
              ),

              CheckoutButton(
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