import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/theme/app_decoration.dart';
import '/core/theme/app_text_styles.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    required this.bgColor,
    this.width = 200.0,
    this.height = 48.0,
    this.radius = 8.0,
    this.elevation = 0,
    this.textStyle,
  });
  final String text;
  final VoidCallback onTap;
  final Color bgColor;
  final double width, height, radius, elevation;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: elevation,
          shape: AppDecoration.borderDialog(radius: radius),
        ),
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
