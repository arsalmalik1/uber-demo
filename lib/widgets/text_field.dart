import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/colors.dart';
import 'gaps.dart';
import 'headings.dart';

Widget textField(
    {required TextEditingController controller,
    required String hint,
    String validateText = 'Field is required.',
    IconData? prefix,
    bool enabled = true,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    TextInputType textType = TextInputType.text,
    int maxLines = 1,
    bool obscureText = false,
    String? prefixText,
    Function? onTap,
    Widget? suffix,
    Color hintColor = hintColor,
    double rad = 8.0,
    bool isTitle = true,
    Function? onSubmit,
    bool focus = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (isTitle)
        headingSmall(hint, size: 14, weigth: FontWeight.w200, color: hintColor),
      if (isTitle) h10,
      TextFormField(
        maxLength: maxLength,
        controller: controller,
        keyboardType: textType,
        onFieldSubmitted: (value) {
          if (onSubmit != null) {
            onSubmit();
          }
        },
        autofocus: focus,
        validator: (value) => value!.isEmpty ? validateText : null,
        inputFormatters: inputFormatters ?? [],
        obscureText: obscureText,
        maxLines: maxLines,
        enabled: enabled,
        decoration: InputDecoration(
            suffix: suffix,
            counterText: "",
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: primary),
                borderRadius: BorderRadius.circular(rad),
                gapPadding: 0),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8.0),
                gapPadding: 0),
            filled: true,
            prefix: prefixText == null
                ? null
                : GestureDetector(
                    onTap: () {
                      if (onTap != null) {
                        onTap();
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.only(right: 8, left: 5),
                        child: subHeadingBold(prefixText,
                            size: 16, color: primary)),
                  ),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 42, minHeight: 22),
            prefixIcon: prefix == null
                ? null
                : Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Icon(
                      prefix,
                      color: hintColor,
                    ),
                  ),
            hintStyle: TextStyle(
              color: hintColor,
            ),
            hintText: isTitle ? '' : hint,
            fillColor: whiteColor),
      ),
    ],
  );
}

Widget phoneField(
    {required TextEditingController controller,
    required String hint,
    String validateText = 'Field is required.',
    String? prefix,
    bool enabled = true,
    Function? onChanged,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    TextInputType textType = TextInputType.text,
    int maxLines = 1,
    bool obscureText = false,
    String? prefixText,
    Function? onTap,
    bool isTitle = true,
    bool focus = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (isTitle)
        headingSmall(hint, size: 14, weigth: FontWeight.w200, color: hintColor),
      if (isTitle) h10,
      TextFormField(
        maxLength: maxLength,
        controller: controller,
        keyboardType: textType,
        autofocus: focus,
        validator: (value) => value!.isEmpty ? validateText : null,
        inputFormatters: inputFormatters ?? [],
        obscureText: obscureText,
        maxLines: maxLines,
        onChanged: (v) {
          if (onChanged != null) {
            onChanged(v);
          }
        },
        enabled: enabled,
        decoration: InputDecoration(
            counterText: "",
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
                gapPadding: 0),
            filled: true,
            prefixIcon: prefixText == null
                ? null
                : GestureDetector(
                    onTap: () {
                      if (onTap != null) {
                        onTap();
                      }
                    },
                    child: Container(
                        padding: const EdgeInsets.only(right: 8, left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            subHeadingBold(prefixText,
                                size: 18, color: primary),
                          ],
                        )),
                  ),
            hintStyle: const TextStyle(
              color: hintColor,
            ),
            hintText: isTitle ? null : hint,
            fillColor: whiteColor),
      ),
    ],
  );
}
