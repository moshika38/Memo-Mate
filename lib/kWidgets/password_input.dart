// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CoustomPasswordInput extends StatefulWidget {
  final double? width;

  final double? heigth;

  final Color? backGroundColor;

  final Color? focusBorderColor;

  final Color? borderColor;
  final double? borderSize;
  final double? borderRadius;

  final String? hintText;
  final Color? hintTextColor;
  final double? hintTextSize;
  final FontWeight? hintTextFontWeigth;

  final String? lableText;
  final Color? lableTextColor;
  final double? lableTextSize;
  final FontWeight? lableTextFontWeigth;

  final IconData? prefixIcon;
  final double? prefixIconSize;
  final Color? prefixIconColor;

  final double? suffixIconSize;
  final Color? suffixIconColor;

  final FontWeight? inputTextFontWeigth;
  final double? inputTextSize;
  final Color? inputTextColor;

  final String? errMassege;
  final Color? errBorderColor;

  final double? contentPaddingHorizontal;

  final TextEditingController controller;

  const CoustomPasswordInput({
    super.key,
    this.width,
    this.backGroundColor,
    this.focusBorderColor,
    this.borderColor,
    this.borderSize,
    this.borderRadius,
    this.hintText,
    this.hintTextColor,
    this.hintTextSize,
    this.hintTextFontWeigth,
    this.lableText,
    this.lableTextColor,
    this.lableTextSize,
    this.lableTextFontWeigth,
    this.prefixIcon,
    this.prefixIconSize,
    this.prefixIconColor,
    this.suffixIconSize,
    this.suffixIconColor,
    this.inputTextFontWeigth,
    this.inputTextSize,
    this.inputTextColor,
    this.contentPaddingHorizontal,
    this.errMassege,
    this.errBorderColor,
    required this.controller,
    this.heigth,
  });

  @override
  State<CoustomPasswordInput> createState() => _CoustomPasswordInputState();
}

class _CoustomPasswordInputState extends State<CoustomPasswordInput> {
  bool isVisible = true;
  double? heigth;

  @override
  Widget build(BuildContext context) {
    if (widget.heigth != null) {
      heigth = widget.heigth!.toDouble();
    } else {
      heigth = 20;
    }

    return SizedBox(
      width: widget.width,
      child: TextFormField(
        obscureText: isVisible,
        controller: widget.controller,
        validator: (value) {
          if (value!.isEmpty) {
            return widget.errMassege;
          }
          return null;
        },
        style: TextStyle(
          color: widget.inputTextColor,
          fontSize: widget.inputTextSize,
          fontWeight: widget.inputTextFontWeigth,
        ),
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.errBorderColor ?? Colors.red,
              width: widget.borderSize ?? 1,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              vertical: heigth!.toDouble(),
              horizontal: widget.contentPaddingHorizontal ??
                  15), // Set content padding to zero
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            borderSide: BorderSide(
              color: widget.borderColor ?? Colors.black,
              width: widget.borderSize ?? 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            borderSide: BorderSide(
              color: widget.focusBorderColor ?? Colors.deepPurple,
              width: widget.borderSize ?? 1,
            ),
          ),
          fillColor: widget.backGroundColor ?? Colors.white,
          filled: true,

          prefixIcon: widget.prefixIcon != null
              ? Icon(
                  widget.prefixIcon,
                  size: widget.prefixIconSize,
                  color: widget.prefixIconColor,
                )
              : null,

          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                if (isVisible == true) {
                  isVisible = false;
                } else {
                  isVisible = true;
                }
              });
            },
            child: Icon(
              isVisible ? Icons.visibility_off : Icons.visibility,
              size: widget.suffixIconSize,
              color: widget.suffixIconColor,
            ),
          ),
          label: Text(
            widget.lableText ?? "",
            style: TextStyle(
              color: widget.lableTextColor,
              fontSize: widget.lableTextSize,
              fontWeight: widget.lableTextFontWeigth,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.hintTextColor,
            fontSize: widget.hintTextSize,
            fontWeight: widget.hintTextFontWeigth,
          ),
        ),
      ),
    );
  }
}


/*


==========================================================

TextEditingController _userInput = TextEditingController();

==========================================================

CoustomInputWidget(
  controller: _userInput,
),

==========================================================

if (_formKey.currentState!.validate()) {
    String userINputtext = _userInput.text;
    print(userINputtext);
}
==========================================================


 */