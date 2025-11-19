import 'package:flutter/material.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 55,
    this.width = double.infinity,
    this.bgColor = AppColors.primaryColor,
    this.borderColor,
    this.textColor,
  });
  final String text;
  final Function() onPressed;
  final double height;
  final double width;
  final Color bgColor;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          side: borderColor != null
              ? BorderSide(color: borderColor ?? AppColors.darkColor)
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.body.copyWith(
            color: textColor ?? AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
