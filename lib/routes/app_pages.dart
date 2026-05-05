import 'package:get/get.dart';

import '/modules/auth/bindings/login_binding.dart';
import '/modules/auth/views/login_view.dart';
import 'app_routes.dart';

class AppPages {
  static String getInitPage() {
    //  if (AppUtils.validateTokenTimeout()) return Routes.root;
    return AppRoutes.login;
  }

  static final routes = [
    // GetPage(
    //   name: Routes.root,
    //   page: () => const RootView(),
    //   binding: RootBinding(),
    // ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
