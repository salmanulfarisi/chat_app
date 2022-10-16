import 'package:chat_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

class Themes {
  static final lightMode = ThemeData(
    primarySwatch: Colors.red,
    primaryColor: bluishclr,
    brightness: Brightness.light,
  );
  static final darkMode = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark,
  );
}
