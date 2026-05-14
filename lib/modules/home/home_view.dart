import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '/core/theme/app_colors.dart';
import '/core/theme/app_text_styles.dart';
import '/core/utils/app_talker.dart';
import '/widget/buttons/elevated_button_widget.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: false,
        title: Text(
          'Home',
          style: AppTextStyles.normalTextW700(color: Colors.white, size: 20),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          ElevatedButtonWidget(
            text: 'View log',
            onTap: () {
              Get.to(TalkerScreen(talker: AppTalker.talker));
            },
            bgColor: AppColors.primaryColor,
            elevation: 1,
          ),
          SizedBox(height: 15),
          ElevatedButtonWidget(
            text: 'Test',
            onTap: () {},
            bgColor: AppColors.primaryColor,
            elevation: 1,
          ),
          Row(),
        ],
      ),
    );
  }
}
