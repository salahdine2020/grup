// lib/controllers/order_controller.dart
import 'package:get/get.dart';
import '../models/order_model.dart';
import '../services/order_service.dart';

class OrderController extends GetxController {
  var orders = <Order>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  void fetchOrders() async {
    isLoading(true);
    try {
      var response = await Get.find<OrderService>().fetchOrders('userId'); // Pass userId accordingly
      if (response.statusCode == 200) {
        // Parse orders and assign to orders list
        // Example: List<Order> data = parseOrders(response.body);
        // orders.assignAll(data);
      }
    } catch (e) {
      print("Error fetching orders: $e");
    } finally {
      isLoading(false);
    }
  }
}
