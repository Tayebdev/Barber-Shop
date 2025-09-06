import 'package:el_hou/core/style/app_padding.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constant/app_images.dart';
import '../../core/constant/app_sizes.dart';
import '../widget/store_widget/grid_layout.dart';
import '../widget/store_widget/product_cart_vertical.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
        leading: Image.asset(AppImages.logoDark),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.shopping_bag, size: AppSizes.iconMd),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: GridLayout(
            itemCount: 10,
            mainAxisCount: 210.5,
            itemBuilder: (context, index) => ProductCartVertical(),
          ),
        ),
      ),
    );
  }
}
