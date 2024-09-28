// lib/bindings/order_binding.dart
import 'package:get/get.dart';
import '../../controllres/resturant_controller/order_controller.dart';
import '../../services/order_service.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderService());
    Get.lazyPut(() => OrderController());
  }
}
