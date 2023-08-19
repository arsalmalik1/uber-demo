import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:uber_rider/utils/colors.dart';
import 'package:uber_rider/widgets/button.dart';
import 'package:uber_rider/widgets/gaps.dart';
import 'package:uber_rider/widgets/rounded_image.dart';

class DriverHomeView extends StatelessWidget {
  const DriverHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  roundedImage('assets/customer.jpeg', 100, 50),
                  w15,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Lennert Wick',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.star,
                            size: 14,
                          ),
                          Text(
                            '4.8',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              h20,
              button(text: 'Accept Ride', onTap: () {}),
              h10,
              button(
                  text: 'Decline',
                  onTap: () {},
                  backColor: whiteColor,
                  textColor: primary),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              roundedImage('assets/user.jpeg', 100, 50),
              LiteRollingSwitch(
                //initial value
                value: true,
                textOn: 'Online',
                textOff: 'Offline',
                colorOn: Colors.greenAccent,
                colorOff: Colors.redAccent,
                iconOn: Icons.done,
                iconOff: Icons.remove_circle_outline,
                textSize: 16.0,
                onChanged: (bool state) {
                  //Use it to manage the different states
                  print('Current State of SWITCH IS: $state');
                },
                onDoubleTap: () {},
                onSwipe: () {},
                onTap: () {},
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.search_outlined,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
