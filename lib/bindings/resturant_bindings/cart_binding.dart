// lib/bindings/cart_binding.dart
import 'package:get/get.dart';
import '../../controllres/resturant_controller/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartController());
  }
}
