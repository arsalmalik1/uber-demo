import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';
import 'package:uber_rider/controllers/dashboard_controller.dart';
import 'package:uber_rider/utils/colors.dart';
import 'package:uber_rider/widgets/appbar.dart';
import 'package:uber_rider/widgets/gaps.dart';
import 'package:uber_rider/widgets/headings.dart';
import 'package:uber_rider/widgets/wrapper.dart';

import '../widgets/text_field.dart';

class PickupView extends StatelessWidget {
  const PickupView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          appBar: appBar('Get a Ride'),
          body: wrapper(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                h20,
                topSection(controller),
                h10,
                if (controller.rides.isNotEmpty)
                  subHeading('Rides near to You',
                      color: hintColor.withOpacity(0.5)),
                h10,
                Expanded(child: ridersWidget(controller))
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget ridersWidget(DashboardController controller) {
    return ListView.builder(
        itemCount: controller.rides.length,
        shrinkWrap: true,
        itemBuilder: (c, i) {
          var ride = controller.rides[i];
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        ride['image'],
                        height: 80,
                        width: 80,
                      )
                    ],
                  ),
                  w10,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      h10,
                      headingSmall(ride['name']),
                      h5,
                      subHeading('${ride['time']} - ${ride['away']} away')
                    ],
                  )),
                  Container(
                      margin: const EdgeInsets.only(top: 10, right: 10),
                      child: headingSmall('\$${ride['price']}',
                          size: 16, weigth: FontWeight.w500)),
                ],
              ),
            ),
          );
        });
  }

  Widget topSection(DashboardController controller) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.greenAccent)),
            ),
            h10,
            Dash(
                direction: Axis.vertical,
                length: 35,
                dashLength: 2,
                dashColor: hintColor.withOpacity(0.6)),
            h10,
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.redAccent,
                  border: Border.all(width: 2, color: Colors.redAccent)),
            ),
          ],
        ),
        w10,
        Expanded(
            child: Column(children: <Widget>[
          textField(
              onSubmit: () {
                controller.findRides();
              },
              prefix: Icons.my_location_outlined,
              controller: controller.pickupController,
              hint: 'Enter pick-up location',
              isTitle: false,
              hintColor: hintColor.withOpacity(0.5)),
          h15,
          textField(
              onSubmit: () {
                controller.findRides();
              },
              prefix: Icons.near_me_outlined,
              controller: controller.destinationController,
              hint: 'Where to?',
              isTitle: false,
              hintColor: hintColor.withOpacity(0.5)),
        ]))
      ],
    );
  }
}
