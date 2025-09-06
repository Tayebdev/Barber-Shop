import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingController extends GetxController with GetSingleTickerProviderStateMixin {
  static MyBookingController get to => Get.find();
  late TabController tabController;
  
  // Observable lists
  final upcomingBookings = <BookingModel>[].obs;
  final completedBookings = <BookingModel>[].obs;
  final cancelledBookings = <BookingModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    _loadBookings();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void _loadBookings() {
    // Simulate API call with dummy data
    upcomingBookings.value = [
      BookingModel(
        date: "Dec 22, 2024 • 10:00 AM",
        serviceName: "Lighthouse barbers",
        serviceType: "Haircut",
        price: "\$25.00",
        description: "Get the best hair trimming done with professional tools",
        image: "https://via.placeholder.com/80x80",
        status: "Upcoming",
        statusColor: Colors.red,
      ),
      BookingModel(
        date: "Nov 25, 2024 • 12:00 PM",
        serviceName: "Glamorous Salon",
        serviceType: "Massage",
        price: "\$45.00",
        description: "Relax and rejuvenate with our premium massage service",
        image: "https://via.placeholder.com/80x80",
        status: "Upcoming",
        statusColor: Colors.red,
      ),
      BookingModel(
        date: "Oct 15, 2024 • 3:00 PM",
        serviceName: "Classic Barber Shop",
        serviceType: "Shave & Cut",
        price: "\$35.00",
        description: "Complete grooming package with beard trim",
        image: "https://via.placeholder.com/80x80",
        status: "Upcoming",
        statusColor: Colors.red,
      ),
    ];

    completedBookings.value = [
      BookingModel(
        date: "Nov 20, 2024 • 2:00 PM",
        serviceName: "Modern Men Barber",
        serviceType: "Premium Cut",
        price: "\$40.00",
        description: "Professional styling with premium products",
        image: "https://via.placeholder.com/80x80",
        status: "Completed",
        statusColor: Colors.green,
        showButtons: true,
        buttonText1: "View E-Receipt",
        buttonText2: "Rate & Review",
      ),
      BookingModel(
        date: "Oct 8, 2024 • 11:00 AM",
        serviceName: "Wicked Barber",
        serviceType: "Haircut",
        price: "\$30.00",
        description: "Classic haircut with modern styling techniques",
        image: "https://via.placeholder.com/80x80",
        status: "Completed",
        statusColor: Colors.green,
        showButtons: true,
        buttonText1: "View E-Receipt",
        buttonText2: "Rate & Review",
      ),
    ];

    cancelledBookings.value = [
      BookingModel(
        date: "Dec 5, 2024 • 4:00 PM",
        serviceName: "Barbershop Zona",
        serviceType: "Full Service",
        price: "\$50.00",
        description: "Complete grooming package with wash and style",
        image: "https://via.placeholder.com/80x80",
        status: "Cancelled",
        statusColor: Colors.orange,
        showButtons: true,
        buttonText1: "Cancel Booking",
        buttonText2: "Reschedule",
      ),
      BookingModel(
        date: "Nov 28, 2024 • 6:00 PM",
        serviceName: "Barbershop Barbers",
        serviceType: "Trim & Style",
        price: "\$35.00",
        description: "Professional trim with styling consultation",
        image: "https://via.placeholder.com/80x80",
        status: "Cancelled",
        statusColor: Colors.orange,
        showButtons: true,
        buttonText1: "Cancel Booking",
        buttonText2: "Reschedule",
      ),
    ];
  }

  // Action methods
  void onSearchPressed() => Get.snackbar("Search", "Search functionality");
  void onMorePressed() => Get.snackbar("More", "More options");
  
  void onViewEReceiptPressed(BookingModel booking) {
    Get.snackbar("E-Receipt", "Viewing receipt for ${booking.serviceName}");
  }

  void onRateReviewPressed(BookingModel booking) {
    Get.snackbar("Rate & Review", "Rating ${booking.serviceName}");
  }

  void onCancelBookingPressed(BookingModel booking) {
    Get.snackbar("Cancel", "Cancelling booking for ${booking.serviceName}");
  }

  void onReschedulePressed(BookingModel booking) {
    Get.snackbar("Reschedule", "Rescheduling ${booking.serviceName}");
  }
}

// Booking Model
class BookingModel {
  final String date;
  final String serviceName;
  final String serviceType;
  final String price;
  final String description;
  final String image;
  final String status;
  final Color statusColor;
  final bool showButtons;
  final String? buttonText1;
  final String? buttonText2;

  BookingModel({
    required this.date,
    required this.serviceName,
    required this.serviceType,
    required this.price,
    required this.description,
    required this.image,
    required this.status,
    required this.statusColor,
    this.showButtons = false,
    this.buttonText1,
    this.buttonText2,
  });
}