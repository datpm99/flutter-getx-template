import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/theme/app_colors.dart';
import '/modules/home/home_view.dart';
import '/modules/product/product_view.dart';
import '/modules/setting/setting_view.dart';
import 'root_controller.dart';
import 'widgets/bottom_navbar.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        bool shouldPop = await controller.canPop();
        if (shouldPop && context.mounted) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        body: Obx(() {
          return IndexedStack(
            index: controller.selectedNav.value,
            children: [HomeView(), ProductView(), SettingView()],
          );
        }),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.grey6)),
          ),
          child: BottomNavBar(),
        ),
      ),
    );
  }
}
