import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/theme/app_decoration.dart';
import '/core/theme/app_text_styles.dart';

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.sideColor,
    this.width = 200.0,
    this.height = 48.0,
    this.radius = 8.0,
    this.elevation = 0,
    this.textStyle,
  });
  final String text;
  final VoidCallback onTap;
  final Color sideColor;
  final double width, height, radius, elevation;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: sideColor,
          shape: AppDecoration.borderDialog(radius: radius),
          side: BorderSide(width: 1, color: sideColor),
          backgroundColor: Colors.white,
          elevation: elevation,
        ),
        onPressed: onTap,
        child: Text(
          text.tr,
          style: (textStyle != null)
              ? textStyle
              : AppTextStyles.mediumTextW700(color: Colors.white),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
