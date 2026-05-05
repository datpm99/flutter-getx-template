import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDecoration {
  /// --- Border TextField ---
  static OutlineInputBorder inputBorder({
    Color color = AppColors.grey3,
    double radius = 8,
    double borderWidth = 1,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: color, width: borderWidth),
    );
  }

  /// --- Border Dialog ---
  static OutlinedBorder borderDialog({double radius = 8}) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }

  /// --- Box Shadow ---
  /// 0px 4px 8px rgba(0, 0, 0, 0.15)
  static List<BoxShadow> boxShadow1() {
    return [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.15),
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ];
  }

  /// --- Box Decoration ---
  static BoxDecoration boxDecoration1({double radius = 8, Color? color}) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecoration2({
    double radius = 8,
    double border = 1,
    Color? color,
    Color? borderColor,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      border: Border.all(width: border, color: borderColor ?? Colors.grey),
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
