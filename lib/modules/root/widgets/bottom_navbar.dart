import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/theme/app_colors.dart';
import '/core/theme/app_text_styles.dart';
import '/modules/root/root_controller.dart';

class BottomNavBar extends GetView<RootController> {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final items = controller.navData.map(
          (e) => BottomNavigationBarItem(
            label: e.name.tr,
            icon: Image.asset(e.icon, width: 24, color: Colors.grey),
            activeIcon: Image.asset(
              e.iconActive,
              width: 24,
              color: AppColors.blue4,
            ),
            backgroundColor: Colors.white,
          ),
        ).toList();

    return Obx(
      () => BottomNavigationBar(
        items: items,
        elevation: 8,
        iconSize: 18,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        onTap: controller.onTapNav,
        currentIndex: controller.selectedNav.value,
        selectedItemColor: AppColors.blue4,
        unselectedItemColor: AppColors.grey2,
        unselectedLabelStyle: AppTextStyles.normalText(size: 10),
        selectedLabelStyle: AppTextStyles.smallTextW500(),
      ),
    );
  }
}
