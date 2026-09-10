import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class CheckoutPaymentmethodIconbuttons extends StatelessWidget{
  final VoidCallback onCardTap;
  final VoidCallback onWalletTap;

  const CheckoutPaymentmethodIconbuttons({
    super.key,
    required this.onCardTap,
    required this.onWalletTap,
});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        GestureDetector(
          onTap: onCardTap,
          child: Container(
            height: AppSizes.icon80,
            width: AppSizes.icon80,
            decoration: BoxDecoration(
              border: BoxBorder.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(AppSizes.textfieldRadius_24),
            ),
            child: Column(
              children: [

                SizedBox(height: AppSizes.p8,),

                Icon(
                  Icons.credit_card,
                  size: AppSizes.icon32,
                  color: Colors.black,
                ),

                Text(
                  "Card",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: AppSizes.textSmallSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
        ),

        SizedBox(width: AppSizes.p8,),

        GestureDetector(
          onTap: onWalletTap,
          child: Container(
            height: AppSizes.icon80,
            width: AppSizes.icon80,
            decoration: BoxDecoration(
              border: BoxBorder.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(AppSizes.textfieldRadius_24),
            ),
            child: Column(
              children: [

                SizedBox(height: AppSizes.p8,),

                Icon(
                  Icons.account_balance_wallet,
                  size: AppSizes.icon32,
                  color: Colors.black,
                ),

                Text(
                  "Wallet",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: AppSizes.textSmallSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              ],
            ),
          ),
        )

      ],
    );
  }
}