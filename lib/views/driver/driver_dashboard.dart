import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/driver_dashboard_controller.dart';

class DriverDashboardView extends StatelessWidget {
  DriverDashboardView({super.key});
  final dashboardController = Get.put(DriverDashboardController());
  @override
  Widget build(BuildContext context) {
    return GetX<DriverDashboardController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            elevation: 0,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.explore_outlined,
                    size: 30,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bar_chart_outlined,
                    size: 30,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle_outlined,
                    size: 30,
                  ),
                  label: ''),
            ],
            onTap: (index) {
              controller.setIndex(index);
            },
          ),
          body: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: controller.tabs[controller.currentIndex.value]),
        ),
      );
    });
  }
}
