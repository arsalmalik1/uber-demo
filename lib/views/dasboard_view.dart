import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_rider/controllers/dashboard_controller.dart';
import 'package:uber_rider/utils/colors.dart';
import 'package:uber_rider/views/pickup_view.dart';
import 'package:uber_rider/widgets/gaps.dart';
import 'package:uber_rider/widgets/headings.dart';
import 'package:uber_rider/widgets/text_field.dart';
import 'package:uber_rider/widgets/wrapper.dart';

import '../widgets/appbar.dart';

class DasboardView extends StatelessWidget {
  DasboardView({super.key});
  DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        backgroundColor: bg,
        appBar: simpleAppbar(
            Icons.location_on, 'Location sharing disabled', 'enable'),
        body: wrapper(
          Column(
            children: [
              h20,
              GestureDetector(
                onTap: () {
                  Get.to(() => PickupView());
                },
                child: textField(
                    onTap: () {},
                    enabled: false,
                    prefix: Icons.search,
                    controller: controller.searchController,
                    hint: 'Enter pick-up points',
                    isTitle: false,
                    hintColor: hintColor.withOpacity(0.5)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
