import 'package:flutter/material.dart';
import 'package:memo_mate/utils/colors.dart';

class AppTextStyle {
  TextStyle kTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors().kPinkColor,
  );

  TextStyle kSubTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors().kWhiteColor,
  );

  TextStyle kDescription = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors().kWhiteColor,
  );

  TextStyle kNormalText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors().kWhiteColor,
  );
}
