import 'package:get/get.dart';

import '/core/utils/app_helper.dart';
import '/modules/auth/bindings/login_binding.dart';
import '/modules/auth/views/login_view.dart';
import '/modules/root/root_binding.dart';
import '/modules/root/root_view.dart';
import 'app_routes.dart';

class AppPages {
  static String getInitPage()  {
    bool isValidate = AppHelper.validateTokenTimeout();
    if (isValidate) return AppRoutes.root;
    return AppRoutes.login;
  }

  static final routes = [
    GetPage(
      name: AppRoutes.root,
      page: () => RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
