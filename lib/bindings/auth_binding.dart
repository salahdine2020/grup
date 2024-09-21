// lib/bindings/auth_binding.dart
import 'package:get/get.dart';
import 'package:grup/controllres/auth_controller.dart';
import '../services/auth_service.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => AuthController());
  }
}
