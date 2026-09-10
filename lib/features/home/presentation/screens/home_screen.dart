import 'package:flutter/material.dart';
import 'package:shopapp/core/constants/app_sizes.dart';
import 'package:shopapp/features/home/presentation/widgets/home_filter_singlechildscrollview.dart';
import 'package:shopapp/features/home/presentation/widgets/home_search_textfield.dart';

class HomeScreen extends StatelessWidget{
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.p16,),
            child: Column(
              children: [

                SizedBox(height: AppSizes.paddingScreen,),

                HomeSearchTextfield(searchController: searchController,),

                SizedBox(height: AppSizes.p16,),

                SizedBox(
                  height: AppSizes.imageSize,
                  width: AppSizes.imageSize,
                  child: ColoredBox(
                    color: Colors.black12,
                  ),
                ),

                SizedBox(height: AppSizes.p20,),

                HomeFilterSinglechildscrollview(),

                SizedBox(height: AppSizes.p20,),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        "Special for you",
                        style: TextStyle(
                          fontSize: AppSizes.textSmallTitleSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "See All",
                        style: TextStyle(
                          fontSize: AppSizes.textSmallTitleSize,
                          color: Colors.black,
                        ),
                      ),

                    ],
                  )
                ),

                SizedBox(height: AppSizes.p12,),

                SizedBox(
                  height: AppSizes.imageSize,
                  width: AppSizes.imageSize,
                  child: ColoredBox(color: Colors.black12),
                )

              ],
            ),
          ),
        )
      ),
    );
  }
}