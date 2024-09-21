// lib/bindings/cart_binding.dart
import 'package:get/get.dart';
import 'package:grup/controllres/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
