import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

bool isArabic(BuildContext context) {
  return context.locale.languageCode == 'ar';
}

extension LocaleExtension on BuildContext {
  bool get isArabic => locale.languageCode == 'ar';
}

extension SizedBix on num {
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}

extension PlatformExtension on BuildContext {
  bool get isDesktopSize => MediaQuery.of(this).size.width >= 600;
  bool get isTabletSize =>
      MediaQuery.of(this).size.width >= 400 &&
      MediaQuery.of(this).size.width < 600;
  bool get isMobileSize => MediaQuery.of(this).size.width < 400;
}