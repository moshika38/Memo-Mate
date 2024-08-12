// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';

class CoustomDropDownMenu extends StatefulWidget {
  final double? width;
  final double? height;
  final double? contentPadding;
  final double? topPadding;

  final String? HintText;
  final Color? HintTextColor;
  final double? HintTextSize;
  final FontWeight? HintTextFontWeight;

  final Color? optionTextColor;
  final double? optionTextSize;
  final FontWeight? optionTextFontWeight;

  final Color? BgColor;
  final Color? BoderColor;
  final double? BoderSize;
  final double? BoderRadius;

  final double? iconSize;
  final Color? iconColor;
  final IconData? icon;

  final Color? focusBorderColor;
  final IconData? focusBorderWidth;

  final List<String> options;
  final Function(String) onChanged; // Callback function එක

  const CoustomDropDownMenu({
    super.key,
    this.HintText,
    this.HintTextColor,
    this.HintTextSize,
    this.HintTextFontWeight,
    this.BgColor,
    this.BoderColor,
    this.BoderSize,
    this.BoderRadius,
    this.iconSize,
    this.iconColor,
    this.icon,
    this.optionTextColor,
    this.optionTextSize,
    this.optionTextFontWeight,
    this.width,
    this.height,
    this.contentPadding,
    this.topPadding,
    required this.options,
    this.focusBorderColor,
    this.focusBorderWidth,
    required this.onChanged, // Callback function එක
  });

  @override
  State<CoustomDropDownMenu> createState() => Coustom_DropDownMenuState();
}

// ignore: camel_case_types
class Coustom_DropDownMenuState extends State<CoustomDropDownMenu> {
  String selectedValue = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: widget.contentPadding ?? 5),
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.BoderRadius ?? 10),
            color: widget.BgColor ?? Colors.white,
            border: Border.all(
              color: widget.BoderColor ?? Colors.black,
              width: widget.BoderSize ?? 2,
            ),
          ),
          child: SizedBox(
            height: widget.height,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: Icon(
                  widget.icon ?? Icons.arrow_drop_down,
                  size: widget.iconSize ?? 30,
                  color: widget.iconColor ?? Colors.black,
                ),
                isExpanded: true,
                isDense: true,
                hint: Text(
                  selectedValue.isEmpty
                      ? widget.HintText ?? ""
                      : selectedValue,
                  style: TextStyle(
                    color: widget.HintTextColor ?? Colors.black,
                    fontWeight:
                        widget.HintTextFontWeight ?? FontWeight.normal,
                    fontSize: widget.HintTextSize,
                  ),
                ),
                items: widget.options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: widget.optionTextColor ?? Colors.black,
                        fontWeight:
                            widget.optionTextFontWeight ?? FontWeight.normal,
                        fontSize: widget.optionTextSize,
                      ),
                    ),
                  );
                }).toList(), // Convert Iterable to List
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue!;
                    widget.onChanged(selectedValue); // Callback
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
/* 

==========================================================

String? selectionValue;

==========================================================

CoustomDropDownMenu(
  options: ['male', 'female'],
                     
  onChanged: (value) {
    setState(() {
      selectionValue = value;
    });
  },
),

==========================================================

"selectionValue" this is a selected value, direct use
for oparations
==========================================================

*/
