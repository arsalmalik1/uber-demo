import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'gaps.dart';
import 'headings.dart';

Widget topSection({String? image, String? title, String? subTitle}) {
  return Column(
    children: [
      h20,
      SvgPicture.asset(image!, width: Get.width * 0.5),
      h20,
      heading(title),
      h15,
      subHeading(subTitle, textAlign: TextAlign.center),
      h40,
    ],
  );
}
