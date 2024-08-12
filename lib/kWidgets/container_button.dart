import 'package:flutter/material.dart';

class CoustomButoon extends StatelessWidget {
  final double? width;
  final double? heith;
  final double? borderRadius;
  final Color? bgColor;
  final Color? borderColor;
  final double? borderWidth;

  final Function? onTap;
  final Gradient? gradient;

  final String? text;
  final double? textSize;
  final Color? textColors;
  final FontWeight? textWeight;

  final TextStyle? textStyle;

  const CoustomButoon({
    super.key,
    this.width,
    this.heith,
    this.borderRadius,
    this.bgColor,
    this.borderColor,
    this.borderWidth,
    this.text,
    this.textSize,
    this.textColors,
    this.textWeight,
    this.onTap,
    this.gradient, this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? 200,
        height: heith ?? 50,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadiusDirectional.circular(borderRadius ?? 5),
          color: bgColor ?? Colors.white,
          border: Border.all(
            width: borderWidth ?? 1,
            color: borderColor ?? Colors.black,
          ),
        ),
        child: Center(
          child: Text(
            text ?? "Submit",
            style:textStyle?? TextStyle(
              color: textColors ?? Colors.black,
              fontWeight: textWeight ?? FontWeight.w500,
              fontSize: textSize ?? 15,
            ),
          ),
        ),
      
    );
  }
}
