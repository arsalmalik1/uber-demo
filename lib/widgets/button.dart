import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

Widget button(
    {required String text,
    required Function onTap,
    Color textColor = whiteColor,
    Color backColor = primary,
    double height = 50,
    double rad = 10,
    bool isLoading = false}) {
  return GestureDetector(
    onTap: () {
      onTap();
    },
    child: isLoading
        ? SizedBox(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            ),
          )
        : Container(
            height: height,
            width: Get.width,
            // padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: backColor,
                border: Border.all(color: primary),
                borderRadius: BorderRadius.all(Radius.circular(rad))),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: textColor),
              ),
            ),
          ),
  );
}

Widget floatingButton(
    {String? title, Function? onTap, bool isLoading = false}) {
  return isLoading
      ? SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        )
      : Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: button(
              text: title!,
              onTap: () {
                onTap!();
              }));
}
