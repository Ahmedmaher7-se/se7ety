import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_styles.dart';

enum DialogType { error, success, warning }

showMyDialog(
  BuildContext context,
  String message, {
  DialogType type = DialogType.error,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(20),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      backgroundColor: type == DialogType.error
          ? AppColors.redColor
          : type == DialogType.success
          ? AppColors.primaryColor
          : AppColors.accentColor,
      content: Text(
        message,
        style: TextStyles.body.copyWith(color: AppColors.whiteColor),
      ),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: AppColors.darkColor.withValues(alpha: .7),
    builder: (context) {
      return Center(
        child: Lottie.asset("assets/images/loading.json", width: 200),
      );
    },
  );
}
