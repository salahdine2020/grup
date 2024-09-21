// lib/utils/custom_snackbar.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void showCustomSnackbar(String title, String message, {bool isError = false}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: isError ? Colors.red : Colors.green,
    colorText: Colors.white,
  );
}
