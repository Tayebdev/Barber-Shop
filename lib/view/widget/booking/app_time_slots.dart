import 'package:el_hou/core/constant/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/booking/booking_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../utils/helper/function_helpers.dart';

class AppTimeSlots extends StatelessWidget {
  const AppTimeSlots({super.key});
  static final controller = BookingController.instance;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Hours",
          style: Theme.of(context).textTheme.headlineSmall!.apply(
            color: dark ? AppColors.white : AppColors.dark,
            fontWeightDelta: 2,
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwSections / 4),
        SizedBox(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.timeSlots.length,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final time = controller.timeSlots[index];
              return Obx(() {
                final isSelected = controller.isTimeSelected(time);
                return GestureDetector(
                  onTap: () => controller.selectTimeSlot(time),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary
                          : AppHelperFunctions.isDarkMode(context)
                          ? AppColors.dark
                          : AppColors.light,
                      borderRadius: BorderRadius.circular(
                        AppSizes.cardRadiusLg * 2,
                      ),
                      border: Border.all(color: AppColors.primary),
                    ),
                    child: Text(
                      time,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.white
                            : AppHelperFunctions.isDarkMode(context)
                            ? AppColors.white
                            : AppColors.dark,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }
}
