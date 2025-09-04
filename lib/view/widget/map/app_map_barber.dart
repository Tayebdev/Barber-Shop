import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';

import '../../../controller/barber_map_controller.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_images.dart';
import '../../../core/constant/app_sizes.dart';
import '../../../utils/helper/function_helpers.dart';

class AppMapBarber extends StatelessWidget {
  AppMapBarber({super.key});
  final BarberMapController mapController = Get.put(BarberMapController());

  @override
  Widget build(BuildContext context) {
    final dark=AppHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Our Address", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
            border: Border.all(color: AppColors.primary.withOpacity(0.2)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
            child: SizedBox(
              height: 250,
              width: double.infinity,
              child: Obx(
                () => FlutterMap(
                  options: const MapOptions(
                    initialCenter: LatLng(36.19, 5.41),
                    initialZoom: 14,
                  ),
                  children: [
                    // Dark theme tile layer
                    TileLayer(
                      urlTemplate:
                          'https://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}{r}.png',
                      subdomains: const ['a', 'b', 'c', 'd'],
                      userAgentPackageName: 'com.elhou.barbershop',
                    ),

                    // Markers
                    MarkerLayer(
                      markers: [
                        // Start location marker
                        Marker(
                          point: BarberMapController.startLocation,
                          width: 40,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(
                              Iconsax.location,
                              color: Colors.white,
                              size: AppSizes.iconSm,
                            ),
                          ),
                        ),

                        Marker(
                          point: BarberMapController.barberLocation,
                          width: 50,
                          height: 50,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.primary,
                                width: 3,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ClipOval(
                                child: Image.asset(
                                  AppImages.logoDark,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (mapController.routePoints.isNotEmpty)
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: mapController.routePoints,
                            strokeWidth: 6,
                            color: Colors.black.withOpacity(0.4),
                          ),
                          Polyline(
                            points: mapController.routePoints,
                            strokeWidth: 4,
                            color: AppColors.primary,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Obx(
          () => Container(
            padding: const EdgeInsets.all(AppSizes.defaultSpace / 2),
            decoration: BoxDecoration(
              color: dark ? Theme.of(context).cardColor:AppColors.grey,
              borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildInfoItem(
                  context,
                  Iconsax.routing,
                  "Distance",
                  "${mapController.calculateDistance(BarberMapController.startLocation, BarberMapController.barberLocation).toStringAsFixed(1)} km",
                ),
                Container(
                  height: 30,
                  width: 1,
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.3),
                ),
                _buildInfoItem(
                  context,
                  Iconsax.clock,
                  "Est. Time",
                  "${mapController.getEstimatedTravelTime()} min",
                ),
                Container(
                  height: 30,
                  width: 1,
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.3),
                ),
                _buildInfoItem(
                  context,
                  Iconsax.car,
                  "Route",
                  mapController.routePoints.isEmpty ? "Loading" : "Ready",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildInfoItem(
  BuildContext context,
  IconData icon,
  String label,
  String value,
) {
  return Column(
    children: [
      Icon(icon, color: AppColors.primary, size: AppSizes.iconSm),
      const SizedBox(height: 4),
      Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
      ),
      Text(
        value,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      ),
    ],
  );
}
