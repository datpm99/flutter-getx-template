import 'package:get/get.dart';

import '/modules/home/home_controller.dart';
import '/modules/product/product_controller.dart';
import '/modules/setting/setting_controller.dart';
import 'root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RootController());
    Get.put(HomeController());
    Get.lazyPut<ProductController>(() => ProductController(), fenix: true);
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);
  }
}
