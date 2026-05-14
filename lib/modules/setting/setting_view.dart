import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/theme/app_colors.dart';
import '/core/theme/app_decoration.dart';
import '/core/theme/app_text_styles.dart';
import '/core/utils/app_helper.dart';
import 'setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: false,
        title: Text(
          'Settings',
          style: AppTextStyles.normalTextW700(color: Colors.white, size: 20),
        ),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: AppHelper.logout,
            child: Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.grey6),
                boxShadow: AppDecoration.boxShadow1(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.grey),
                  SizedBox(width: 10),
                  Text('Logout', style: AppTextStyles.normalText()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
