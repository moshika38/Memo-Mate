import 'package:flutter/material.dart';
import 'package:memo_mate/main.dart';
import 'package:memo_mate/utils/colors.dart';
import 'package:memo_mate/utils/text_style.dart';

class CoustomAlertMassege {
  static void showPopup(
    BuildContext context,
    String title,
    Widget list,
    VoidCallback onTap,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors().cardBgColor,
          title: Text(
            title,
            style: AppTextStyle().kSubTitle,
          ),
          content: list,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                onTap();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}


/* 

====================================================

CoustomAlertMassege.showPopup(
  context,
  'Are you sure ?',
  SizedBox(),
  () {},
);

====================================================

*/