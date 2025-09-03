import 'package:flutter/material.dart';
import '../../../core/constant/app_sizes.dart';
import 'app_card_barbers.dart';

class AppBarbers extends StatelessWidget {
  const AppBarbers({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Barbers in the shop',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: AppSizes.spaceBtwItems / 2),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return AppCardBarbers();
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: AppSizes.spaceBtwItems / 2);
            },
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
