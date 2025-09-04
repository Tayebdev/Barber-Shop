import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;
import 'package:latlong2/latlong.dart';

class BarberMapController extends GetxController {
  // Observable route points
  final RxList<LatLng> routePoints = <LatLng>[].obs;
  
  // Loading state
  final RxBool isLoadingRoute = false.obs;
  
  // Error state
  final RxString errorMessage = ''.obs;
  
  // OpenRouteService API Key
  static const String _apiKey = "5b3ce3597851110001cf6248efa11e5870f8488bbda68ed144a2f545";
  
  // Default locations (Sétif)
  static const LatLng startLocation = LatLng(36.1900, 5.4000); // University of Sétif 1
  static const LatLng barberLocation = LatLng(36.1911, 5.4167); // Barbershop location
  
  @override
  void onInit() {
    super.onInit();
    fetchRouteFromORS();
  }
  
  /// Fetch route from OpenRouteService
  Future<void> fetchRouteFromORS({
    LatLng? start,
    LatLng? destination,
  }) async {
    try {
      isLoadingRoute.value = true;
      errorMessage.value = '';
      
      final startPoint = start ?? startLocation;
      final endPoint = destination ?? barberLocation;
      
      final url = Uri.parse(
        "https://api.openrouteservice.org/v2/directions/driving-car"
        "?api_key=$_apiKey"
        "&start=${startPoint.longitude},${startPoint.latitude}"
        "&end=${endPoint.longitude},${endPoint.latitude}",
      );
      
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final coords = data['features'][0]['geometry']['coordinates'];
        
        routePoints.value = coords
            .map<LatLng>((c) => LatLng(c[1], c[0])) // Convert to lat,lng
            .toList();
          
      } else {
        errorMessage.value = "Failed to load route: ${response.statusCode}";
        debugPrint("ORS error: ${response.body}");
      }
    } catch (e) {
      errorMessage.value = "Network error occurred";
      debugPrint("Exception while fetching route: $e");
      
      Get.snackbar(
        'Route Error',
        'Failed to load navigation route',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoadingRoute.value = false;
    }
  }
  
  /// Refresh route
  void refreshRoute() {
    fetchRouteFromORS();
  }
  
  /// Calculate distance between two points (in kilometers)
  double calculateDistance(LatLng start, LatLng end) {
    const double earthRadius = 6371; // Earth's radius in km
    
    double lat1Rad = start.latitude * (math.pi / 180);
    double lat2Rad = end.latitude * (math.pi / 180);
    double deltaLatRad = (end.latitude - start.latitude) * (math.pi / 180);
    double deltaLngRad = (end.longitude - start.longitude) * (math.pi / 180);
    
    double a = math.sin(deltaLatRad / 2) * math.sin(deltaLatRad / 2) +
        math.cos(lat1Rad) * math.cos(lat2Rad) *
        math.sin(deltaLngRad / 2) * math.sin(deltaLngRad / 2);
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    
    return earthRadius * c;
  }
  
  /// Get estimated travel time (in minutes) - rough estimation
  int getEstimatedTravelTime() {
    if (routePoints.isEmpty) return 0;
    
    double totalDistance = calculateDistance(startLocation, barberLocation);
    // Assuming average speed of 30 km/h in city
    return (totalDistance / 30 * 60).round();
  }
  
  /// Clear route
  void clearRoute() {
    routePoints.clear();
  }
}