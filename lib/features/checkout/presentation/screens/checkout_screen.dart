import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_appbar.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_pay_button.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_paymentmethod_iconbuttons.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_textfield.dart';

class CheckoutScreen extends StatelessWidget{
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController adressController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardDateController = TextEditingController();
  final TextEditingController cardCVVController = TextEditingController();
  final TextEditingController cardNameController = TextEditingController();

  CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: checkoutAppbar(
        "Checkout",
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

                  Row(
                    children: [

                      Expanded(
                        child: CheckoutTextfield(
                          name: "Name",
                          controller: nameController,
                          prefixIcon: Icons.person,
                        ),
                      ),

                      SizedBox(width: AppSizes.p8,),

                      Expanded(
                        child: CheckoutTextfield(
                          name: "Email Address",
                          controller: emailController,
                          prefixIcon: Icons.email,
                        ),
                      ),

                    ],
                  ),

                  SizedBox(height: AppSizes.p16,),

                  CheckoutTextfield(
                    name: "Address",
                    controller: adressController,
                    prefixIcon: Icons.location_on,
                  ),

                  SizedBox(height: AppSizes.p16,),

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

              CheckoutPayButton(
                text: "Pay Securely",
                onPressed: (){},
              ),

            ],
          )
        ),
      ),
    );
  }
}