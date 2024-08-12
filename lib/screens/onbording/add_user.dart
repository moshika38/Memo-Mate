import 'package:flutter/material.dart';
import 'package:memo_mate/kWidgets/container_button.dart';
import 'package:memo_mate/kWidgets/input_feild.dart';
import 'package:memo_mate/main.dart';
import 'package:memo_mate/services/user_services.dart';
import 'package:memo_mate/utils/colors.dart';
import 'package:memo_mate/utils/text_style.dart';

class AddUserPage extends StatelessWidget {
  final PageController page;
  const AddUserPage({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController userName = TextEditingController();
    String uName;

    Future<void> addData() async {
      if (userName.text.isEmpty) {
        uName = "User";
      } else {
        uName = userName.text;
      }
      await UserServices.saveData(uName);
    }

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            "Tell us your name",
            style: AppTextStyle().kSubTitle.copyWith(
                  fontSize: 15,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          CoustomInputWidget(
            borderRadius: 100,
            controller: userName,
            width: MediaQuery.of(context).size.width * 0.9,
            backGroundColor: AppColors().kbgColor,
            borderColor: AppColors().kPinkColor,
            focusBorderColor: AppColors().kPinkColor,
            inputTextColor: AppColors().kWhiteColor,
            heigth: 22,
          ),
          const SizedBox(
            height: 45,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ),
                );
              },
              child: GestureDetector(
                onTap: () {
                  addData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ),
                  );
                },
                child: CoustomButoon(
                  width: 200,
                  heith: 60,
                  borderRadius: 100,
                  gradient: AppColors().kPrimaryGradient,
                  text: "Let's Go",
                  textColors: AppColors().kWhiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
