import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/theme/app_colors.dart';
import '/core/theme/app_text_styles.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          width: 120,
          height: 111,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Color(0xffe5e7eb)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
              SizedBox(height: 12),
              Text('loading'.tr, style: AppTextStyles.mediumText()),
            ],
          ),
        ),
      ),
    );
  }
}
