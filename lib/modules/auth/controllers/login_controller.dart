import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '/core/utils/app_helper.dart';
import '/data/repository/auth_repository.dart';
import '/routes/app_routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void onLogin(BuildContext context) async {
    try {
      bool isValid = Form.of(context).validate();
      if (!isValid) return;

      AppHelper.showLoader();
      final result = await AuthRepository().login(
        username: usernameController.text.trim(),
        password: passwordController.text,
      );
      AppHelper.hideDialog();

      if (result != null) {
        AppHelper.setTokenAndTimeOut(result);
        Get.offNamed(AppRoutes.root);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
    usernameController.text = 'emilys';
    passwordController.text = 'emilyspass';
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
