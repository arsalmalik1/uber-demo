import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

var formatter = NumberFormat('#,##,000');

String amountSeparator(double? amount) {
  if (amount == null) {
    return '0.0';
  }
  return formatter.format(amount);
}

String dateFormate(DateTime date) {
  //'May 20, 2022'
  return DateFormat('MMM d, yyyy').format(date);
}
