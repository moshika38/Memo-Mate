import 'package:flutter/material.dart';

class CoustomRadioButton extends StatefulWidget {
  final Function(String) onChanged;
  final List<String>? values;
  final double contentWidth;

  final Color? activeColor;

  final Color? lableColor;
  final double? lableSize;
  final FontWeight? lableFontWeight;

  final Color? radioButtonBorderColor;

  const CoustomRadioButton({
    super.key,
    required this.onChanged,
    this.values,
    required this.contentWidth,
    this.activeColor,
    this.lableColor,
    this.lableSize,
    this.lableFontWeight,
    this.radioButtonBorderColor,
  });

  @override
  State<CoustomRadioButton> createState() => _CoustomRadioButtonState();
}

class _CoustomRadioButtonState extends State<CoustomRadioButton> {
  String? _selectedValue = "Dark";

  final List<String> _values = [
    'Dark',
    'Light',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _values.map((values) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * widget.contentWidth,
          child: RadioTheme(
            data: RadioThemeData(
              fillColor: WidgetStatePropertyAll(widget.radioButtonBorderColor),
            ),
            child: RadioListTile<String>(
              contentPadding: const EdgeInsets.all(0),
              activeColor: widget.activeColor,
              title: Text(
                values,
                style: TextStyle(
                  fontSize: widget.lableSize,
                  fontWeight: widget.lableFontWeight,
                  color: widget.activeColor,
                ),
              ),
              value: values,
              groupValue: _selectedValue,
              onChanged: (String? value) {
                setState(() {
                  _selectedValue = value;
                  widget.onChanged(_selectedValue!);
                });
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}


/*


==========================================================

String? selectedRadioValue;

==========================================================

CoustomRadioButton(
  values: ['name', 'male'],
  contentWidth: 0.3,
  onChanged: (value) {
    setState(() {
      selectedRadioValue = value;
    });
  },
),

==========================================================

print(selectedRadioValue);

==========================================================


 */