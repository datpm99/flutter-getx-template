import 'package:flutter/material.dart';

import '/core/theme/app_colors.dart';
import '/core/theme/app_theme.dart';

class AppTextStyles {
  static TextStyle _style(
    Color? color,
    double font,
    FontWeight? fontWeight,
    double? height,
  ) => TextStyle(
    color: color ?? AppColors.black1,
    fontSize: font,
    fontWeight: fontWeight ?? FontWeight.normal,
    height: height,
    fontFamily: AppTheme.fontFamily,
  );

  /// --- Small (12px) ---
  static TextStyle smallText({Color? color, double? height}) => _style(color, 12, null, height);
  static TextStyle smallTextW500({Color? color, double? height}) => _style(color, 12, FontWeight.w500, height);
  static TextStyle smallTextW600({Color? color, double? height}) => _style(color, 12, FontWeight.w600, height);
  static TextStyle smallTextW700({Color? color, double? height}) => _style(color, 12, FontWeight.w700, height);
  static TextStyle smallTextW800({Color? color, double? height}) => _style(color, 12, FontWeight.w800, height);
  static TextStyle smallTextW900({Color? color, double? height}) => _style(color, 12, FontWeight.w900, height);

  /// --- Normal (14px) ---
  static TextStyle normalText({Color? color, double size = 14, double? height}) => _style(color, size, null, height);
  static TextStyle normalTextW500({Color? color, double size = 14, double? height}) => _style(color, size, FontWeight.w500, height);
  static TextStyle normalTextW600({Color? color, double size = 14, double? height}) => _style(color, size, FontWeight.w600, height);
  static TextStyle normalTextW700({Color? color, double size = 14, double? height}) => _style(color, size, FontWeight.w700, height);
  static TextStyle normalTextW800({Color? color, double size = 14, double? height}) => _style(color, size, FontWeight.w800, height);
  static TextStyle normalTextW900({Color? color, double size = 14, double? height}) => _style(color, size, FontWeight.w900, height);

  /// --- Medium (16px) ---
  static TextStyle mediumText({Color? color, double? height}) => _style(color, 16, FontWeight.normal, height);
  static TextStyle mediumTextW500({Color? color, double? height}) => _style(color, 16, FontWeight.w500, height);
  static TextStyle mediumTextW600({Color? color, double? height}) => _style(color, 16, FontWeight.w600, height);
  static TextStyle mediumTextW700({Color? color, double? height}) => _style(color, 16, FontWeight.w700, height);
  static TextStyle mediumTextW800({Color? color, double? height}) => _style(color, 16, FontWeight.w800, height);
  static TextStyle mediumTextW900({Color? color, double? height}) => _style(color, 16, FontWeight.w900, height);

  /// --- Big (18px) ---
  static TextStyle bigText({Color? color, double? height}) => _style(color, 18, FontWeight.normal, height);
  static TextStyle bigTextW500({Color? color, double? height}) => _style(color, 18, FontWeight.w500, height);
  static TextStyle bigTextW600({Color? color, double? height}) => _style(color, 18, FontWeight.w600, height);
  static TextStyle bigTextW700({Color? color, double? height}) => _style(color, 18, FontWeight.w700, height);
  static TextStyle bigTextW800({Color? color, double? height}) => _style(color, 18, FontWeight.w800, height);
  static TextStyle bigTextW900({Color? color, double? height}) => _style(color, 18, FontWeight.w900, height);

  /// --- Special Styles ---
  static TextStyle textUnderline({Color? color, double? size, FontWeight? w, double? height}) => TextStyle(
    color: color ?? AppColors.black1,
    fontSize: size ?? 14,
    fontWeight: w ?? FontWeight.normal,
    height: height,
    decoration: TextDecoration.underline,
    fontFamily: AppTheme.fontFamily,
  );

  static TextStyle textItalic({Color? color, double? size, FontWeight? w, double? height}) => TextStyle(
    color: color ?? AppColors.black1,
    fontSize: size ?? 14,
    fontWeight: w ?? FontWeight.normal,
    height: height,
    fontStyle: FontStyle.italic,
    fontFamily: AppTheme.fontFamily,
  );
}
