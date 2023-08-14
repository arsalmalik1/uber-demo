import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_rider/utils/helper.dart';

import '../utils/demo.dart';

class DashboardController extends GetxController {
  TextEditingController searchController = TextEditingController();
  TextEditingController pickupController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  RxList rides = [].obs;
  findRides() {
    if (pickupController.text.isEmpty) {
      showCustomSnackBars('Please select pickup location');
      return;
    }
    if (destinationController.text.isEmpty) {
      showCustomSnackBars('Please select destination location');
      return;
    }
    rides.value = ridesDemo;
    update();
  }
}
