import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBars(String? message, {bool isError = true}) {
  // ignore: deprecated_member_use
  Get.showSnackbar(GetBar(
    backgroundColor: isError ? Colors.red : Colors.green,
    message: message,
    duration: const Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(10.0),
    borderRadius: 5,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
  ));
}
