import 'package:flutter/material.dart';

Widget roundedImage(String image, double rad, double size) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(rad),
    child: Image.asset(
      image,
      height: size,
      width: size,
      fit: BoxFit.cover,
    ),
  );
}
