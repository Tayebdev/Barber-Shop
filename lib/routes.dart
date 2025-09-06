import 'package:el_hou/utils/splash/splash_screen.dart';
import 'package:el_hou/view/screen/auth/login_view.dart';
import 'package:el_hou/view/screen/auth/signup_view.dart';
import 'package:el_hou/view/screen/booking/booking_view.dart';
import 'package:el_hou/view/screen/onboarding_view.dart';
import 'package:get/get.dart';
import 'core/constant/app_routes.dart';
import 'navigation_menu.dart';
import 'view/screen/barber_details_view.dart';
import 'view/screen/my_booking_view.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: AppRoutes.route, page: () => SplashScreen()),
  GetPage(name: AppRoutes.onboarding, page: () => OnboardingView()),
  GetPage(name: AppRoutes.login, page: () => LoginView()),
  GetPage(name: AppRoutes.signup, page: () => SignupView()),
  GetPage(name: AppRoutes.navigationMenu, page: () => NavigationMenu()),
  GetPage(name: AppRoutes.barbers, page: () => BarbersDetailsView()),
  GetPage(name: AppRoutes.booking, page: () => BookingView()),
  GetPage(name: AppRoutes.myBooking, page: () => MyBookingView()),
];
