import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/core/router/app_routes.dart';
import 'package:shopapp/features/account/presentation/cubit/account_cubit.dart';
import 'package:shopapp/features/account/presentation/cubit/account_state.dart';
import 'package:shopapp/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:shopapp/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_appbar.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_pay_button.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_paymentmethod_iconbuttons.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_textfield.dart';

class CheckoutScreen extends StatefulWidget{
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController shippingAddressController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardDateController = TextEditingController();
  final TextEditingController cardCVVController = TextEditingController();
  final TextEditingController cardNameController = TextEditingController();
  bool paymentMethodIsCard = true;

  @override
  void initState() {
    super.initState();
    context.read<CheckoutCubit>().getPaymentCardDetails();
    context.read<AccountCubit>().getCurrentUserData();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    shippingAddressController.dispose();
    cardCVVController.dispose();
    cardDateController.dispose();
    cardNameController.dispose();
    cardNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [

        BlocListener<CheckoutCubit, CheckoutState>(
          listener: (context, state) {
            if(state is CheckoutLoaded){
              shippingAddressController.text = state.paymentCardDetailsEntity.shippingAddress;
              cardNumberController.text = state.paymentCardDetailsEntity.cardNumber;
              cardDateController.text = state.paymentCardDetailsEntity.expiryDate;
              cardCVVController.text = state.paymentCardDetailsEntity.cvv;
              cardNameController.text = state.paymentCardDetailsEntity.nameOnCard;
              setState(() {
                paymentMethodIsCard = state.paymentCardDetailsEntity.paymentMethod == "card" ? true : false;
              });
            }
          },
        ),

        BlocListener<AccountCubit, AccountState>(
          listener: (context, state) {
            if (state is AccountLoaded) {
              nameController.text = state.currentUserEntity.name;
              emailController.text = state.currentUserEntity.email;
            }
          },
        ),

      ],
      child: Scaffold(
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
                        controller: shippingAddressController,
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
                        onCardTap: (){
                          setState(() {
                            paymentMethodIsCard = true;
                          });
                        },
                        cardColor: paymentMethodIsCard == true ? Colors.black12
                            : Colors.transparent,
                        onWalletTap: (){
                          setState(() {
                            paymentMethodIsCard = false;
                          });
                        },
                        walletColor: paymentMethodIsCard == false ? Colors.black12
                            : Colors.transparent,
                      ),

                      SizedBox(height: AppSizes.p16,),

                      paymentMethodIsCard == false ? Center(
                        child: Text(
                          "Pay in cash when you receive your order.",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: AppSizes.textDefaultSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                          : Column(
                        children: [

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

                    ],
                  ),

                  CheckoutPayButton(
                    text: "Pay Securely",
                    onPressed: () async{
                      context.go(AppRoutes.orderSuccessScreen);
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