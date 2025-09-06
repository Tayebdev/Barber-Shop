import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/my_booking_controller.dart';
import '../../core/constant/app_colors.dart';
import '../../core/constant/app_images.dart';

class MyBookingView extends StatelessWidget {
  const MyBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller here instead of using binding
    final controller = Get.put(MyBookingController());

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF1A1A1A),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A1A1A),
          elevation: 0,
          title: Text(
            "My Booking",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(AppImages.logoDark),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: controller.onSearchPressed,
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz, color: Colors.white),
              onPressed: controller.onMorePressed,
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(text: "Actived"),
                  Tab(text: "Completed"),
                  Tab(text: "Cancelled"),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: const [
            _UpcomingTab(),
            _CompletedTab(),
            _CancelledTab(),
          ],
        ),
      ),
    );
  }
}

class _UpcomingTab extends StatelessWidget {
  const _UpcomingTab();

  @override
  Widget build(BuildContext context) {
    final controller = MyBookingController.to;
    
    return Obx(() => ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: controller.upcomingBookings.length,
      separatorBuilder: (_, __) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        final booking = controller.upcomingBookings[index];
        return _BookingCard(booking: booking);
      },
    ));
  }
}

class _CompletedTab extends StatelessWidget {
  const _CompletedTab();

  @override
  Widget build(BuildContext context) {
    final controller = MyBookingController.to;
    
    return Obx(() => ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: controller.completedBookings.length,
      separatorBuilder: (_, __) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        final booking = controller.completedBookings[index];
        return _BookingCard(booking: booking);
      },
    ));
  }
}

class _CancelledTab extends StatelessWidget {
  const _CancelledTab();

  @override
  Widget build(BuildContext context) {
    final controller = MyBookingController.to;
    
    return Obx(() => ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: controller.cancelledBookings.length,
      separatorBuilder: (_, __) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        final booking = controller.cancelledBookings[index];
        return _BookingCard(booking: booking);
      },
    ));
  }
}

class _BookingCard extends StatelessWidget {
  final BookingModel booking;

  const _BookingCard({required this.booking});

  @override
  Widget build(BuildContext context) {
    final controller = MyBookingController.to;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                booking.date,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: booking.statusColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  booking.status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  booking.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey[800],
                      child: const Icon(
                        Icons.content_cut,
                        color: Colors.white54,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.serviceName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      booking.serviceType,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      booking.description,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      booking.price,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (booking.showButtons && booking.buttonText1 != null && booking.buttonText2 != null) ...[
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _handleButton1Press(controller, booking),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(booking.buttonText1!),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _handleButton2Press(controller, booking),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(booking.buttonText2!),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  void _handleButton1Press(MyBookingController controller, BookingModel booking) {
    switch (booking.status) {
      case 'Completed':
        controller.onViewEReceiptPressed(booking);
        break;
      case 'Cancelled':
        controller.onCancelBookingPressed(booking);
        break;
    }
  }

  void _handleButton2Press(MyBookingController controller, BookingModel booking) {
    switch (booking.status) {
      case 'Completed':
        controller.onRateReviewPressed(booking);
        break;
      case 'Cancelled':
        controller.onReschedulePressed(booking);
        break;
    }
  }
}