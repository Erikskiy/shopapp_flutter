import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:shopapp/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_appbar.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_button.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_textfield.dart';

class ShippingAddressScreen extends StatefulWidget{
  ShippingAddressScreen({super.key});
  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}


class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final TextEditingController shippingAddressController = TextEditingController();

  @override
  void dispose() {
    shippingAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final checkoutCubitState = context.watch<CheckoutCubit>().state;
    if(checkoutCubitState is CheckoutLoaded){
      shippingAddressController.text = checkoutCubitState.paymentCardDetailsEntity.shippingAddress;
    }

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
                    controller: shippingAddressController,
                    prefixIcon: Icons.location_on,
                  ),

                ],
              ),

              CheckoutButton(
                text: "Save",
                onPressed: () async{
                  await context.read<CheckoutCubit>().editShippingAddress(shippingAddressController.text);
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