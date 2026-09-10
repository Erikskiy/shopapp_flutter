import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_appbar.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_button.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_textfield.dart';

class ShippingAddressScreen extends StatelessWidget{
  final TextEditingController adressController = TextEditingController();

  ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: checkoutAppbar(
        "Shipping Address",
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

                  CheckoutTextfield(
                    name: "Address",
                    controller: adressController,
                    prefixIcon: Icons.location_on,
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