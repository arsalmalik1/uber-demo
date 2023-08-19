import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:uber_rider/utils/colors.dart';
import 'package:uber_rider/views/login_view.dart';
import 'package:uber_rider/widgets/headings.dart';

import '../../widgets/gaps.dart';
import '../../widgets/rounded_image.dart';

class DriverProfileView extends StatelessWidget {
  const DriverProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            roundedImage('assets/user.jpeg', 100, 50),
            w15,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'hey, John Warner',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.star,
                      size: 14,
                    ),
                    Text(
                      '4.8 (289)',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        Column(
          children: [
            row(Icons.settings_outlined, 'Settings'),
            h20,
            row(Icons.help_outline_outlined, 'Support'),
            h20,
            row(Icons.info_outline, 'About'),
            h20,
            row(Icons.search, 'History'),
            h20,
            row(Icons.share_outlined, 'Invite Friends'),
            h20,
            row(Icons.power_settings_new_outlined, 'Logout', onTap: () {
              Get.offAll(() => LoginView());
            }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            subHeading('All rights reserved by', color: textColor),
            w5,
            subHeadingBold('Uber Driver', color: textColor),
          ],
        )
      ],
    );
  }

  Widget row(IconData icon, String title, {Function? onTap}) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap();
        }
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: primary,
          ),
          w15,
          subHeadingBold(title, size: 18)
        ],
      ),
    );
  }
}
