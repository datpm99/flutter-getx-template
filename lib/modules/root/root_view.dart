import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      onPopInvoked: (didPop) async {
        NavigatorState navigator = Navigator.of(context);
        bool shouldPop = await controller.canPop();
        if (shouldPop) navigator.pop();
      },
      child: Scaffold(
        body: Obx(() {
          return IndexedStack(
            index: controller.selectedNav.value,
            children: [HomeView(), ProductView(), SettingView()],
          );
        }),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
