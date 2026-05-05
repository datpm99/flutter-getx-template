import 'package:get/get.dart';

import '/data/models/nav_model.dart';
import '/widget/dialogs/close_app_dialog.dart';

class RootController extends GetxController {
  List<NavModel> navData = [];
  RxInt selectedNav = 0.obs;

  @override
  void onInit() {
    super.onInit();
    navData = [
      NavModel(
        icon: 'ic_home.png',
        iconActive: 'ic_home_active.png',
        name: 'nav_home',
      ),
      NavModel(
        icon: 'ic_product.png',
        iconActive: 'ic_product_active.png',
        name: 'nav_product',
      ),
      NavModel(
        icon: 'ic_setting.png',
        iconActive: 'ic_setting_active.png',
        name: 'nav_setting',
      ),
    ];
  }

  void onTapNav(int id) => selectedNav(id);

  Future<bool> canPop() async {
    final result = await Get.dialog(const CloseAppDialog());
    if (result != null && result) {
      // if (GetPlatform.isAndroid) SystemNavigator.pop();
      // if (GetPlatform.isIOS) exit(0);
      return true;
    }
    return false;
  }
}
