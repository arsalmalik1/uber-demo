import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import 'gaps.dart';
import 'headings.dart';

AppBar appBar(title,
    {IconData? icon,
    Function? onPress,
    bool isBack = true,
    String? btnText,
    Function? onLeftPress}) {
  return AppBar(
    leading: !isBack
        ? null
        : IconButton(
            onPressed: () {
              if (onLeftPress != null) {
                onLeftPress();
              }
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            )),
    centerTitle: true,
    title: Text(
      title ?? '',
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    actions: [
      if (onPress != null)
        btnText != null
            ? TextButton(
                onPressed: () {
                  onPress();
                },
                child: subHeadingBold(btnText, color: primary))
            : IconButton(
                onPressed: () {
                  onPress();
                },
                icon: Icon(
                  icon,
                  size: 30,
                  color: primary,
                ))
    ],
  );
}

AppBar simpleAppbar(IconData icon, String title, String? tailing) {
  return AppBar(
      backgroundColor: primary,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              w5,
              headingSmall(title, color: whiteColor, weigth: FontWeight.normal),
              w10
            ],
          ),
          if (tailing != null) headingSmall(tailing),
        ],
      ));
}
