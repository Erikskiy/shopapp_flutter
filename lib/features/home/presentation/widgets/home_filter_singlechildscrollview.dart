import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';

class HomeFilterSinglechildscrollview extends StatelessWidget{
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
                "All",
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
                "Dresses",
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
                "Jackets",
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
                "Jeans",
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
                "AAAA",
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
                "AAAA",
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