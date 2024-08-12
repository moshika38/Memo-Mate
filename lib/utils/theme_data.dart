import 'package:flutter/material.dart';
import 'package:memo_mate/utils/colors.dart';
 
class AppThemeData {
  // dark theme
  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors().kbgColor,
    cardColor: AppColors().cardBgColor,
    cardTheme: CardTheme(color: AppColors().cardBgColor),
    iconTheme: IconThemeData(
      color: AppColors().kWhiteColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors().kbgColor,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors().cardBgColor),
  );

  

  //light theme
  ThemeData lighttheme = ThemeData(
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors().kwhiteCardColor),
    scaffoldBackgroundColor: AppColors().kwhiteBgColor,
    cardColor: AppColors().kwhiteCardColor,
    cardTheme: CardTheme(color: AppColors().kwhiteCardColor),
    iconTheme: IconThemeData(
      color: AppColors().kBlackColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors().kwhiteBgColor,
    ),
  );
}
