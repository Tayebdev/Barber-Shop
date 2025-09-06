import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BookingController extends GetxController {
  // Observable variables
  final Rx<DateTime> focusedDay = DateTime.now().obs;
  final Rx<DateTime?> selectedDay = Rx<DateTime?>(null);
  final RxString selectedTime = ''.obs;
  final RxString selectedSpecialist = ''.obs;
  static BookingController get instance => Get.find();

  // Time slots list
  final List<String> timeSlots = [
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30'
  ];

  // Specialists list
  final List<Map<String, dynamic>> specialists = [
    {
      'name': 'Dr. Emma',
      'specialty': 'Cardiologist',
      'image': 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=100&h=100&fit=crop&crop=face',
      'rating': '4.9'
    },
    {
      'name': 'Dr. Sarah',
      'specialty': 'Dermatologist', 
      'image': 'https://images.unsplash.com/photo-1582750433449-648ed127bb54?w=100&h=100&fit=crop&crop=face',
      'rating': '4.8'
    },
    {
      'name': 'Dr. Johnson',
      'specialty': 'Neurologist',
      'image': 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=100&h=100&fit=crop&crop=face',
      'rating': '4.7'
    },
    {
      'name': 'Dr. Michael',
      'specialty': 'Orthopedic',
      'image': 'https://images.unsplash.com/photo-1622253692010-333f2da6031d?w=100&h=100&fit=crop&crop=face',
      'rating': '4.9'
    },
  ];

  // Computed property for checking if all selections are made
  bool get isAllSelected => 
      selectedDay.value != null && 
      selectedTime.value.isNotEmpty && 
      selectedSpecialist.value.isNotEmpty;

  // Method to select a day
  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
  }

  // Method to change focused day (page change)
  void onPageChanged(DateTime focusedDay) {
    this.focusedDay.value = focusedDay;
  }

  // Method to select time slot
  void selectTimeSlot(String time) {
    selectedTime.value = time;
  }

  // Method to select specialist
  void selectSpecialist(String specialistName) {
    selectedSpecialist.value = specialistName;
  }

  // Method to handle continue button press
  void onContinue() {
    if (isAllSelected) {
      Get.snackbar(
        'Booking Confirmed',
        'Appointment booked for ${selectedDay.value!.day}/${selectedDay.value!.month} at ${selectedTime.value} with ${selectedSpecialist.value}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }

  // Method to clear all selections
  void clearSelections() {
    selectedDay.value = null;
    selectedTime.value = '';
    selectedSpecialist.value = '';
  }

  // Method to check if time slot is selected
  bool isTimeSelected(String time) {
    return selectedTime.value == time;
  }

  // Method to check if specialist is selected
  bool isSpecialistSelected(String name) {
    return selectedSpecialist.value == name;
  }
}