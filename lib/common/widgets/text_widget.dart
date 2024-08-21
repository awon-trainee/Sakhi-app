import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  const TextWidget(
      {Key? key,
      required this.text,
      this.color,
      required this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.decoration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: TextStyle(
        fontFamily: 'RubikRegular',
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
    );
  }
}
