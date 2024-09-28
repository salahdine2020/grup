// lib/bindings/home_binding.dart
import 'package:get/get.dart';
import 'package:grup/controllres/resturant_controller/home_controller.dart';
import '../../services/api_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => HomeController());
  }
}
