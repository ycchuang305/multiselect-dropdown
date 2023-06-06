import 'package:flutter/material.dart';

/// [HintText] is a hint text builder.
/// It is used to build the hint text.
class HintText extends StatelessWidget {
  final TextStyle? hintStyle;
  final String hintText;
  final Color? hintColor;
  final TextStyle? floatingHintStyle;
  final bool isFloating;

  const HintText({
    Key? key,
    this.hintStyle,
    required this.hintText,
    this.hintColor,
    this.isFloating = false,
    this.floatingHintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      hintText,
      style: isFloating
          ? floatingHintStyle
          : hintStyle ??
              TextStyle(
                fontSize: 13,
                color: hintColor ?? Colors.grey.shade300,
              ),
    );
  }
}
