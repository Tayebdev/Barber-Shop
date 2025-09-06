import 'package:el_hou/controller/booking/booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../utils/helper/function_helpers.dart';

class AppCalendar extends StatelessWidget {
  const AppCalendar({super.key});
  static final controller = BookingController.instance;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Date",
          style: Theme.of(context).textTheme.headlineSmall!.apply(
            color: dark ? AppColors.white : AppColors.dark,
            fontWeightDelta: 2,
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwSections / 4),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: dark ? AppColors.dark : AppColors.grey,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: dark ? Colors.black26 : Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Obx(
            () => TableCalendar<dynamic>(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: controller.focusedDay.value,
              selectedDayPredicate: (day) =>
                  isSameDay(controller.selectedDay.value, day),
              calendarFormat: CalendarFormat.month,
              startingDayOfWeek: StartingDayOfWeek.monday,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  color: dark ? AppColors.white : AppColors.dark,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: dark ? AppColors.white : AppColors.dark,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: dark ? AppColors.white : AppColors.dark,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: dark
                      ? AppColors.white.withOpacity(0.7)
                      : AppColors.darkGrey,
                  fontWeight: FontWeight.w500,
                ),
                weekendStyle: TextStyle(
                  color: dark
                      ? AppColors.white.withOpacity(0.7)
                      : AppColors.darkGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                weekendTextStyle: TextStyle(
                  color: dark ? AppColors.white : AppColors.dark,
                ),
                defaultTextStyle: TextStyle(
                  color: dark ? AppColors.white : AppColors.dark,
                ),
                selectedDecoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
                todayDecoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                todayTextStyle: TextStyle(
                  color: dark ? AppColors.white : AppColors.dark,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onDaySelected: controller.onDaySelected,
              onPageChanged: controller.onPageChanged,
            ),
          ),
        ),
      ],
    );
  }
}
