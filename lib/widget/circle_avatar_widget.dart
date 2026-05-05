import 'package:flutter/material.dart';

import '/core/theme/app_colors.dart';
import '/core/theme/app_text_styles.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    super.key,
    this.size = 25,
    this.text = 'A',
    this.color = AppColors.primaryColor,
  });
  final double size;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      radius: size,
      child: Text(text, style: AppTextStyles.bigText(color: Colors.white)),
    );
  }
}
