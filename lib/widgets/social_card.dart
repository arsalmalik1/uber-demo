import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';

Widget socialCard(String icon,
    {bool png = false,
    Function? onPress,
    Color? iconColor,
    Color backColor = whiteColor}) {
  return GestureDetector(
    onTap: () {
      onPress!();
    },
    child: Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      color: backColor,
      child: Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(10),
        child: png
            ? Image.asset(icon)
            : SvgPicture.asset(
                icon,
                color: iconColor,
              ),
      ),
    ),
  );
}
