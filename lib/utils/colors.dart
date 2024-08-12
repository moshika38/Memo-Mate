import 'package:flutter/material.dart';

class AppColors {
  final Color cardBgColor = const Color(0xFF231539);
  final Color kbgColor = const Color(0xFF0e0b16);
  final Color kPinkColor = const Color(0xFFc11b65);
  final Color kPurpleColor = const Color(0xFF49135f);
  final Color kWhiteColor = Colors.white;
  final Color kBlackColor = Colors.black;
  final Color kGrey = Colors.grey;

  final Color kwhiteBgColor = const Color.fromARGB(255, 239, 235, 235);
  final Color kwhiteCardColor = const Color.fromARGB(255, 252, 248, 248);

  LinearGradient kPrimaryGradient = const LinearGradient(
    colors: [
      Color(0xFFc11b65),
      Color(0xFF49135f),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  get darkContainerColor => null;
}
