// lib/controllers/home_controller.dart
import 'package:get/get.dart';
import '../../models/restaurant_model.dart';
import '../../services/api_service.dart';

class HomeController extends GetxController {
  var restaurants = <Restaurant>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRestaurants();
  }

  void fetchRestaurants() async {
    isLoading(true);
    try {
      var response = await Get.find<ApiService>().getRequest('https://api.example.com/restaurants');
      if (response.statusCode == 200) {
        // Parse the response and update restaurants list
        // Example: List<Restaurant> data = parseRestaurants(response.body);
        // restaurants.assignAll(data);
      }
    } catch (e) {
      // Handle error
      print("Error fetching restaurants: $e");
    } finally {
      isLoading(false);
    }
  }
}
