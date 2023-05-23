import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final double paddingVertical;
  final double paddingHorizontal;
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double fontSize;
  final TextAlign? textAlign;
  final double? textHeight;

  const CustomText(
      {super.key, this.paddingHorizontal = 0, this.paddingVertical = 0, this.color, this.fontSize = 14, this.fontWeight, required this.text, this.textAlign, this.textHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          wordSpacing: 1.3,
          letterSpacing: 0.4,
          height: textHeight,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
