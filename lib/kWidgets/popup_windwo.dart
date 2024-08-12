import 'package:flutter/material.dart';
import 'package:memo_mate/kWidgets/input_feild.dart';
import 'package:memo_mate/main.dart';
import 'package:memo_mate/services/cate_services.dart';
import 'package:memo_mate/utils/colors.dart';
import 'package:memo_mate/utils/text_style.dart';

class CoustomPopupWindow {
  void showPopup(BuildContext context, int? id,
      TextEditingController textController, String currentText) {
    // methords

    Future<void> addData() async {
      await CateServices.saveData(textController.text);
      textController.text = "";
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      );
    }

    Future<void> updateData(int id) async {
      await CateServices.updateData(id, textController.text);
      textController.text = "";
      
      Navigator.push(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      );
    }

    if (currentText != "") {
      textController.text = currentText.toString();
    }

    // content

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors().cardBgColor,
          title: Text(
            id == null ? 'Add categorys' : 'Edite categorys',
            style: AppTextStyle().kSubTitle,
          ),
          content: Form(
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                children: [
                  CoustomInputWidget(
                    controller: textController,
                    backGroundColor: AppColors().cardBgColor,
                    borderColor: AppColors().kPinkColor,
                    focusBorderColor: AppColors().kPinkColor,
                    inputTextColor: AppColors().kWhiteColor,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // add or update methord
                if (id == null) {
                  if (textController.text.isNotEmpty) {
                    addData();
                  }
                } else {
                  if (textController.text.isNotEmpty) {
                    updateData(id);
                  }
                }

                Navigator.of(context).pop();
              },
              child: id == null ? Text('Add') : Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
