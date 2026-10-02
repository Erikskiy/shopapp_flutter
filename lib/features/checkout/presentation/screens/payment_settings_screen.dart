import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:shopapp/features/checkout/presentation/cubit/checkout_state.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_appbar.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_button.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_paymentmethod_iconbuttons.dart';
import 'package:shopapp/features/checkout/presentation/widgets/checkout_textfield.dart';

class PaymentSettingsScreen extends StatefulWidget{
  const PaymentSettingsScreen({super.key});

  @override
  State<PaymentSettingsScreen> createState() => _PaymentSettingsScreenState();
}

class _PaymentSettingsScreenState extends State<PaymentSettingsScreen> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardDateController = TextEditingController();
  final TextEditingController cardCVVController = TextEditingController();
  final TextEditingController cardNameController = TextEditingController();
  bool paymentMethodIsCard = true;

  @override
  void initState() {
    super.initState();
    context.read<CheckoutCubit>().getPaymentCardDetails();
  }

  @override
  void dispose() {
    cardCVVController.dispose();
    cardDateController.dispose();
    cardNameController.dispose();
    cardNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, state) {
        if(state is CheckoutLoaded){
          cardNumberController.text = state.paymentCardDetailsEntity.cardNumber;
          cardDateController.text = state.paymentCardDetailsEntity.expiryDate;
          cardCVVController.text = state.paymentCardDetailsEntity.cvv;
          cardNameController.text = state.paymentCardDetailsEntity.nameOnCard;
          setState(() {
            paymentMethodIsCard = state.paymentCardDetailsEntity.paymentMethod == "card" ? true : false;
          });
        }
      },
      child: Scaffold(
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

                CheckoutButton(
                  text: "Save",
                  onPressed: () async{
                    final paymentMethod = paymentMethodIsCard == true ? "card"
                        : "wallet";
                    await context.read<CheckoutCubit>().editPaymentCardDetails(paymentMethod, cardNumberController.text, cardDateController.text, cardCVVController.text, cardNameController.text);
                    context.pop();
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}