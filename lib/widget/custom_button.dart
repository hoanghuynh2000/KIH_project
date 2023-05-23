import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kih_project/utils/app_color.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onTap, this.color, this.width, this.outlineColor, this.textColor});
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final Color? outlineColor;
  final Color? textColor;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      color: color ?? AppColors.backgroudButton,
      shape: RoundedRectangleBorder(side: BorderSide(color: outlineColor ?? AppColors.backgroudButton), borderRadius: BorderRadius.all(Radius.circular(15))),
      textColor: textColor ?? AppColors.white,
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(fontSize: 15),
      ),
    ).withWidth(double.infinity);
  }
}
