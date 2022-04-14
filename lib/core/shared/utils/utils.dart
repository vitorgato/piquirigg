import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  customSnackBar(String title, String message) {
    return Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red.withOpacity(0.9),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 30),
      isDismissible: true,
      duration: const Duration(milliseconds: 2000),
    );
  }
}
