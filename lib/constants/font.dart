import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppFonts{
  static TextStyle mainFont() {
    return TextStyle(
        fontSize: 22, fontWeight: FontWeight.w500, color: AppColors.secondaryColor);
  }

  static TextStyle subFont() {
    return TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black);
  }

    static TextStyle subColorFont() {
    return TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.secondaryColor);
  }
}