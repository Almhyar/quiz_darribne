import 'package:flutter/material.dart';
import 'package:quiz/UI/shared/colors.dart';
import 'package:quiz/UI/shared/utils.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.content,
    this.colorText,
    this.fontSize,
    this.fontWeight,
    this.decoration,
    this.decorationThickness,
    this.textAlign,
  });
  final String content;
  final Color? colorText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final double? decorationThickness;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: textAlign ?? TextAlign.start,
      style: TextStyle(
        color: colorText ?? AppColors.mainBlackColor,
        fontSize: fontSize ?? screenWidth(27),
        fontWeight: fontWeight ?? FontWeight.w400,
        decoration: decoration ?? TextDecoration.none,
        decorationThickness: decorationThickness ?? 0,
      ),
    );
  }
}
