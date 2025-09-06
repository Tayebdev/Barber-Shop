import 'package:el_hou/core/style/app_padding.dart';
import 'package:el_hou/view/widget/booking/app_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/booking/booking_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_routes.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../utils/helper/function_helpers.dart';
import '../../widget/appbar/appbar_widget.dart';
import '../../widget/barbers_widget/app_barber_haircut.dart';
import '../../widget/booking/app_time_slots.dart';
import '../../widget/bottom_navigation_bar/app_bottom_navigation.dart';

class BookingView extends StatelessWidget {
  const BookingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookingController());
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: AppBottomNavigation(
        onPressed: () {
          Get.toNamed(AppRoutes.navigationMenu);
          AppHelperFunctions.successSnackBar(
            duration: 3,
            title: 'Booking Confirmed',
            message: 'Your appointment has been successfully scheduled.',
          );
        },
      ),
      backgroundColor: dark ? AppColors.dark : AppColors.white,
      appBar: UAppBar(
        showBackArrow: true,
        title: Text(
          "Book Appointment",
          style: Theme.of(context).textTheme.headlineMedium!.apply(
            color: dark ? AppColors.white : AppColors.dark,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppCalendar(),
              const SizedBox(height: AppSizes.spaceBtwSections / 2),
              AppTimeSlots(),
              const SizedBox(height: AppSizes.spaceBtwSections / 2),
              AppBarberHaircut(),
              const SizedBox(height: AppSizes.spaceBtwSections / 2),
            ],
          ),
        ),
      ),
    );
  }
}
