import 'package:flutter/material.dart';
 
class CoustomCheckboxWidget extends StatefulWidget {
  final double? width;
  final double? heigth;

  final double? borderRadious;
  final double? borderWidth;
  final Color? borderColor;

  final Color? backGroundColor;

  final Color? iconColor;
  final double? iconSize;
  final Color? errBorderColor;
  final Function(bool) onChanged;

  final bool? leftSideLable;
  final bool? rightSideLable;
  final double? leftLableSpace;
  final double? rightLableSpace;

  final Color? lableColor;
  final Color? lableErrColor;
  final double? lableFontSize;
  final FontWeight? lableFontWeight;

  final String? leftLableText;
  final String? rightLableText;

  const CoustomCheckboxWidget({
    super.key,
    this.width,
    this.heigth,
    this.borderRadious,
    this.borderWidth,
    this.borderColor,
    this.backGroundColor,
    this.iconColor,
    this.iconSize,
    required this.onChanged,
    this.errBorderColor,
    this.leftSideLable,
    this.rightSideLable,
    this.leftLableSpace,
    this.rightLableSpace,
    this.lableColor,
    this.lableErrColor,
    this.lableFontSize,
    this.lableFontWeight,
    this.leftLableText,
    this.rightLableText,
  });

  @override
  State<CoustomCheckboxWidget> createState() => _CoustomCheckboxWidgetState();
}

class _CoustomCheckboxWidgetState extends State<CoustomCheckboxWidget> {
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: widget.leftSideLable ?? false,
          child: Text(
            widget.leftLableText ?? "",
            style: TextStyle(
              fontSize: widget.lableFontSize,
              fontWeight: widget.lableFontWeight,
              color: widget.lableColor,
            ),
          ),
        ),
        SizedBox(
          width: widget.leftLableSpace,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.onChanged(_isChecked);
              if (_isChecked == true) {
                _isChecked = false;
              } else {
                _isChecked = true;
              }
            });
          },
          child: Container(
            width: widget.width ?? 25,
            height: widget.heigth ?? 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadious ?? 5),
              border: Border.all(
                color: widget.borderColor ?? Colors.black,
                width: widget.borderWidth ?? 2,
              ),
              color: widget.backGroundColor ?? const Color(0xFFFFFFFF),
            ),
            child: !_isChecked
                ? Center(
                    child: Icon(
                      Icons.done,
                      size: widget.iconSize ?? 20,
                      color: widget.iconColor ?? Colors.black,
                    ),
                  )
                : null,
          ),
        ),
        SizedBox(
          width: widget.rightLableSpace,
        ),
        Visibility(
          visible: widget.rightSideLable ?? false,
          child: Text(
            widget.rightLableText ?? "",
            style: TextStyle(
              fontSize: widget.lableFontSize,
              fontWeight: widget.lableFontWeight,
              color: widget.lableColor,
            ),
          ),
        ),
      ],
    );
  }
}

/*

==========================================================

bool? isCheked;  // create variable befor use

==========================================================

CoustomCheckboxWidget(
  onChanged: (value) {
    setState(() {
      isCheked = value;
    });
  },
),

==========================================================

"isCheked " this will return bool value.it's can use for 
future oparations

==========================================================


 */