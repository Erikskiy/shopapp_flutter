import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class ProductsSizesSinglechildscrollview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.textfieldRadius_24)),
              color: Colors.black12,
            ),
            child: TextButton(
              onPressed: (){},
              child: Text(
                "XS",
                style: TextStyle(
                  fontSize: AppSizes.textSmallSize,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(width: AppSizes.p12,),

          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.textfieldRadius_24)),
              color: Colors.black12,
            ),
            child: TextButton(
              onPressed: (){},
              child: Text(
                "S",
                style: TextStyle(
                  fontSize: AppSizes.textSmallSize,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(width: AppSizes.p12,),

          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.textfieldRadius_24)),
              color: Colors.black12,
            ),
            child: TextButton(
              onPressed: (){},
              child: Text(
                "M",
                style: TextStyle(
                  fontSize: AppSizes.textSmallSize,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(width: AppSizes.p12,),

          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.textfieldRadius_24)),
              color: Colors.black12,
            ),
            child: TextButton(
              onPressed: (){},
              child: Text(
                "L",
                style: TextStyle(
                  fontSize: AppSizes.textSmallSize,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(width: AppSizes.p12,),

          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.textfieldRadius_24)),
              color: Colors.black12,
            ),
            child: TextButton(
              onPressed: (){},
              child: Text(
                "XL",
                style: TextStyle(
                  fontSize: AppSizes.textSmallSize,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(width: AppSizes.p12,),

          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.textfieldRadius_24)),
              color: Colors.black12,
            ),
            child: TextButton(
              onPressed: (){},
              child: Text(
                "XXL",
                style: TextStyle(
                  fontSize: AppSizes.textSmallSize,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          SizedBox(width: AppSizes.p12,),

          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.textfieldRadius_24)),
              color: Colors.black12,
            ),
            child: TextButton(
              onPressed: (){},
              child: Text(
                "XXXL",
                style: TextStyle(
                  fontSize: AppSizes.textSmallSize,
                  color: Colors.black,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}