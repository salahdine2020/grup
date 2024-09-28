import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../routes/app_routes.dart';
import '../utils/custom_snackbar.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Mock data to simulate account types
  final Map<String, String> mockUsers = {
    "restaurant@example.com": "restaurant",
    "client@example.com": "client",
    "delivery@example.com": "delivery"
  };

  // Simulate login method
  void login() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 2));  // Simulate network delay

    String email = emailController.text;
    String password = passwordController.text;

    // Mock user authentication and type checking
    if (mockUsers.containsKey(email) && password == "password123") {
      String accountType = mockUsers[email]!;

      switch (accountType) {
        case "restaurant":
          Get.offAllNamed(AppRoutes.order);  // Navigate to restaurant's order screen
          break;
        case "client":
          Get.offAllNamed(AppRoutes.client);  // Navigate to client's screen
          break;
        case "delivery":
          Get.offAllNamed(AppRoutes.delivery);  // Navigate to delivery's screen
          break;
        default:
          showCustomSnackbar("Error", "Account type not recognized", isError: true);
      }
    } else {
      showCustomSnackbar("Error", "Invalid email or password", isError: true);
    }

    isLoading(false);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
