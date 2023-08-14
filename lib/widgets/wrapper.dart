import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

Widget wrapper(Widget child, {double pad = 20}) {
  return Container(
    width: Get.width,
    padding: EdgeInsets.symmetric(horizontal: pad),
    child: child,
  );
}
