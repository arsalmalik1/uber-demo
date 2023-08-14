import 'package:flutter/widgets.dart';

import '../utils/colors.dart';

Widget heading(title,
    {TextAlign align = TextAlign.start,
    FontWeight weight = FontWeight.w700,
    Color color = textColor,
    double size = 22}) {
  return Text(
    title,
    textAlign: align,
    style: TextStyle(fontSize: size, fontWeight: weight, color: color),
  );
}

Widget subHeading(title,
    {Color color = textColor,
    TextAlign textAlign = TextAlign.start,
    int? maxLines,
    TextOverflow? overflow,
    double size = 12.0}) {
  return Text(
    title ?? '',
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    style: TextStyle(fontSize: size, fontWeight: FontWeight.w400, color: color),
  );
}

Widget headingSmall(title,
    {int maxLines = 2,
    double size = 18,
    FontWeight weigth = FontWeight.w700,
    Color color = textColor}) {
  return Text(
    title ?? '',
    maxLines: maxLines,
    style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weigth,
        overflow: TextOverflow.ellipsis),
  );
}

Widget subHeadingBold(title,
    {Color color = hintColor,
    double size = 15,
    int? maxLines,
    TextOverflow? overflow,
    FontWeight weight = FontWeight.w600}) {
  return Text(
    title ?? '',
    maxLines: maxLines,
    style: TextStyle(
      fontSize: size,
      fontWeight: weight,
      color: color,
      overflow: overflow,
    ),
  );
}
