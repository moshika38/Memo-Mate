// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CoustomDatePicker extends StatefulWidget {
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

  final IconData? suffixIcon;
  final double? suffixIconSize;
  final Color? suffixIconColor;

  final FontWeight? inputTextFontWeigth;
  final double? inputTextSize;
  final Color? inputTextColor;

  final String? errMassege;
  final Color? errBorderColor;

  final double? contentPaddingHorizontal;

  final TextEditingController controller;

  const CoustomDatePicker({
    super.key,
    this.width,
    this.heigth,
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
    this.suffixIcon,
    this.suffixIconSize,
    this.suffixIconColor,
    this.inputTextFontWeigth,
    this.inputTextSize,
    this.inputTextColor,
    this.contentPaddingHorizontal,
    this.errMassege,
    this.errBorderColor,
    required this.controller,
  });

  @override
  State<CoustomDatePicker> createState() => _CoustomDatePickerState();
}

class _CoustomDatePickerState extends State<CoustomDatePicker> {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null && selectedDate != DateTime.now()) {
      setState(() {
        widget.controller.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
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
          border: InputBorder.none,
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: widget.errBorderColor ?? Colors.red,
            width: widget.borderSize ?? 1,
          )),
          contentPadding: EdgeInsets.symmetric(
              vertical: widget.heigth ?? 00,
              horizontal: widget.contentPaddingHorizontal ?? 15),
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
          suffixIcon: IconButton(
            icon: Icon(
              Icons.calendar_today,
              size: widget.suffixIconSize,
              color: widget.suffixIconColor,
            ),
            onPressed: () => _selectDate(context),
          ),
          label: Text(
            widget.lableText ?? "",
            style: TextStyle(
              color: widget.lableTextColor,
              fontSize: widget.lableTextSize,
              fontWeight: widget.lableTextFontWeigth,
            ),
          ),
          
          hintText:
              widget.hintText ?? DateTime.now().toString().split(' ')[0],
          hintStyle: TextStyle(
            color: widget.hintTextColor ?? Colors.black,
            fontSize: widget.hintTextSize ?? 15,
            fontWeight: widget.hintTextFontWeigth,
          ),
        ),
      ),
    );
  }
}

/*
==========================================================

TextEditingController _inputDate = TextEditingController();

==========================================================

CoustomInputWidget(
  controller: _inputDate,
),

==========================================================

if (_formKey.currentState!.validate()) {
    String inputdate = _inputDate.text;
    print(inputdate);
}
==========================================================

*/