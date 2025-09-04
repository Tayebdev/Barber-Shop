import 'package:el_hou/view/widget/barbers_widget/app_header_barbers.dart';
import 'package:el_hou/view/widget/bottom_navigation_bar/app_bottom_navigation.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/app_sizes.dart';
import '../../widget/barbers_widget/app_barbers_images_slider.dart';

// ignore: must_be_immutable
class BarbersDetailsView extends StatelessWidget {
  BarbersDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppProductImageSlider(),
            Padding(
              padding: EdgeInsets.only(
                left: AppSizes.defaultSpace,
                bottom: AppSizes.defaultSpace,
                right: AppSizes.defaultSpace,
              ),
              child: Column(
                
                children: [
                  AppHeaderBarbers(),
                  Divider(),
                  SizedBox(height: AppSizes.spaceBtwSections/4),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Working Hours',style: Theme.of(context).textTheme.headlineSmall,),
                      SizedBox(height: AppSizes.spaceBtwSections/4),
                      Row(children: [
                        Text("Monday-Friday",style: Theme.of(context).textTheme.bodySmall,),
                        SizedBox(width: AppSizes.spaceBtwItems,),
                        Text(": 08:00 AM - 21:00 PM",style: Theme.of(context).textTheme.bodyLarge,)
                      ],),
                      Row(children: [
                        Text("Saturday-Sunday",style: Theme.of(context).textTheme.bodySmall,),
                        SizedBox(width: AppSizes.spaceBtwItems,),
                        Text(": 10:00 AM - 20:00 PM",style: Theme.of(context).textTheme.bodyLarge,)
                      ],)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
