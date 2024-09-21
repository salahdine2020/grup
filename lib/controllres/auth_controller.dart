// lib/controllers/auth_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';
import '../utils/custom_snackbar.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    isLoading(true);
    try {
      var response = await Get.find<AuthService>().login(
        emailController.text,
        passwordController.text,
      );
      if (response.statusCode == 200) {
        // Handle success, store token, navigate to home
        showCustomSnackbar("Success", "Login successful");
        Get.offAllNamed('/home');
      } else {
        // Show error message
        showCustomSnackbar("Error", "Login failed", isError: true);
      }
    } catch (e) {
      showCustomSnackbar("Error", "An error occurred", isError: true);
    } finally {
      isLoading(false);
    }
  }

  void signup() async {
    isLoading(true);
    try {
      var response = await Get.find<AuthService>().signup(
        emailController.text,
        passwordController.text,
      );
      if (response.statusCode == 200) {
        showCustomSnackbar("Success", "Signup successful");
        Get.offAllNamed('/home');
      } else {
        showCustomSnackbar("Error", "Signup failed", isError: true);
      }
    } catch (e) {
      showCustomSnackbar("Error", "An error occurred", isError: true);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
