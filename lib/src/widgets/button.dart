import 'package:flutter/material.dart';

import '../helper/constants.dart';
import 'custom_text.dart';

Widget button(context, text, Function ontap,
    {Color color = AppColors.purple,
    double radius = 15,
    required width,
    bool check = false}) {
  return ElevatedButton(
      onPressed: () {
        ontap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: check ? AppColors.purple : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: check
            ? EdgeInsets.only(top: 5, bottom: 5)
            : EdgeInsets.only(top: 10, bottom: 10),
        minimumSize: Size(width, 0),
      ),
      child: check
          ? customText(context, "Get Started",
              size: 30,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              fontstyle: FontStyle.italic)
          : customText(context, text, size: 20, fontWeight: FontWeight.w700));
}
