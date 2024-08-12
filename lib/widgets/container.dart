import 'package:flutter/material.dart';
import 'package:memo_mate/utils/colors.dart';

class AppContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Widget child;
  final double? padding;
  const AppContainer({
    super.key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.child, this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding??0),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: AppColors().cardBgColor,
      ),
      child: child,
    );
  }
}
