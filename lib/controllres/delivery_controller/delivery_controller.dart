import 'package:get/get.dart';

class DeliveryController extends GetxController {
  var deliveryName = 'Delivery Joe'.obs;
  var deliveryTasks = [].obs;

  @override
  void onInit() {
    super.onInit();
    // Simulate fetching delivery tasks
    fetchDeliveryTasks();
  }

  void fetchDeliveryTasks() {
    // Simulating API call or data fetching for delivery
    deliveryName.value = "Delivery Joe";
    deliveryTasks.value = [
      {"taskId": 1, "taskName": "Deliver Pizza"},
      {"taskId": 2, "taskName": "Deliver Burger"}
    ];
  }
}
