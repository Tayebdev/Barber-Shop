import 'package:el_hou/core/style/app_padding.dart';
import 'package:el_hou/view/widget/appbar/appbar_widget.dart';
import 'package:el_hou/view/widget/store_widget/grid_layout.dart';
import 'package:flutter/material.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/app_sizes.dart';
import '../../data/static/static.dart';
import '../../utils/helper/function_helpers.dart';
import '../widget/image_widget/app_rounded_image.dart';
import '../widget/rounded_container/app_rounded_container.dart';
import '../widget/store_widget/product_title_text.dart';

class BarberPriceView extends StatelessWidget {
  const BarberPriceView({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: UAppBar(title: const Text("Barber Price")),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Center(
            child: GridLayout(
              itemCount: servicesList.length,
              mainAxisCount: 240.5,
              itemBuilder: (context, index) {
                final service = servicesList[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 180,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.25),
                          spreadRadius: 7,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(
                        AppSizes.productImageRadius,
                      ),
                    ),
                    child: Column(
                      children: [
                        AppRoundedContainer(
                          width: 180,
                          backgroundColor: dark
                              ? AppColors.dark
                              : AppColors.light,
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AppRoundedImage(imageUrl: service["image"]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSizes.spaceBtwItems / 2),
                        Padding(
                          padding: const EdgeInsets.only(left: AppSizes.sm),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppProductTitleText(
                                title: service["title_ar"],
                                smallSize: true,
                              ),
                              SizedBox(height: AppSizes.spaceBtwItems / 2),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${service["price"]} DA",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
