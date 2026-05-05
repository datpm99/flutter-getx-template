import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/extensions/widget_ext.dart';
import '/core/theme/app_colors.dart';
import '/core/theme/app_decoration.dart';
import '/core/theme/app_text_styles.dart';
import '/widget/buttons/elevated_button_widget.dart';

class CloseAppDialog extends StatelessWidget {
  const CloseAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: AppDecoration.borderDialog(radius: 16),
      insetPadding: EdgeInsets.all(28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          Text(
            'confirm_exit'.tr,
            style: AppTextStyles.bigTextW700(color: AppColors.black2),
          ),
          SizedBox(height: 15),
          Text(
            'msg_close_app'.tr,
            style: AppTextStyles.mediumText(color: AppColors.black2),
          ),
          SizedBox(height: 30),
          Row(
            children: [
              ElevatedButtonWidget(
                text: 'no',
                bgColor: Colors.black.withValues(alpha: 0.06),
                textStyle: AppTextStyles.mediumTextW700(),
                onTap: () => Get.back(result: false),
              ).expand(),
              SizedBox(width: 16),
              ElevatedButtonWidget(
                text: 'yes',
                bgColor: Colors.green,
                onTap: () => Get.back(result: true),
              ).expand(),
            ],
          ),
          SizedBox(height: 16),
        ],
      ).pSymmetric(h: 20),
    );
  }
}
