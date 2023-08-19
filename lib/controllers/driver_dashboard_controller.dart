import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_rider/views/driver/driver_profile_view.dart';
import 'package:uber_rider/views/driver/driver_stats_view.dart';

import '../views/driver/driver_home_view.dart';

class DriverDashboardController extends GetxController {
  List<Widget> tabs = [
    const DriverHomeView(),
    const DriverStatsView(),
    const DriverProfileView()
  ];
  RxInt currentIndex = 0.obs;

  setIndex(int index) {
    currentIndex.value = index;
    update();
  }
}
