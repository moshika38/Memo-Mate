import 'package:flutter/material.dart';
import 'package:memo_mate/kWidgets/container_button.dart';
import 'package:memo_mate/utils/colors.dart';
import 'package:memo_mate/utils/text_style.dart';
 

class StartPage extends StatelessWidget {
  final PageController page;
  const StartPage({
    super.key,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.note_add,
          size: 100,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Note Shaper",
          style: AppTextStyle().kTitle.copyWith(fontSize: 30),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        GestureDetector(
          onTap: () {
            page.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
            );
          },
          child: CoustomButoon(
            width: 200,
            heith: 60,
            gradient: AppColors().kPrimaryGradient,
            textStyle: AppTextStyle().kSubTitle.copyWith(fontSize: 15),
            borderRadius: 100,
            text: "Get Start",
          ),
        ),
      ],
    );
  }
}
