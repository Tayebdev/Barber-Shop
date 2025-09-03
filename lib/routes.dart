import 'package:el_hou/utils/splash/splash_screen.dart';
import 'package:get/get.dart';

import 'core/constant/app_routes.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: AppRoutes.route, page: () => SplashScreen()),
];
