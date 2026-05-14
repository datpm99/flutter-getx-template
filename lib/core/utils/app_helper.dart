import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '/core/extensions/widget_ext.dart';
import '/core/theme/app_colors.dart';
import '/core/theme/app_text_styles.dart';
import '/data/models/response/login_response.dart';
import '/data/services/storage_service.dart';
import '/routes/app_routes.dart';
import '/widget/dialogs/loading_dialog.dart';

class AppHelper {
  static void hideDialog() {
    if (Get.isDialogOpen ?? false) Get.back();
  }

  static void showLoader() {
    Get.dialog(LoadingDialog(), barrierDismissible: false);
  }

  static void showError(String message, {bool isClose = true}) {
    if ((Get.isDialogOpen ?? false) && isClose) Get.back();
    Get.snackbar(
      'error'.tr,
      message,
      borderWidth: 0,
      borderRadius: 8,
      overlayBlur: .1,
      overlayColor: Colors.black26,
      backgroundColor: Colors.white,
      animationDuration: 0.45.seconds,
      reverseAnimationCurve: Curves.easeOutExpo,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      margin: EdgeInsets.zero,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: Get.width - 32,
      padding: EdgeInsets.symmetric(vertical: 9, horizontal: 16),
      titleText: SizedBox.shrink(),
      messageText: Row(
        children: [
          SvgPicture.asset('assets/icons/ic_error.svg'),
          SizedBox(width: 8),
          Text(
            message,
            style: AppTextStyles.normalTextW500(color: AppColors.red4),
          ).expand(),
          GestureDetector(
            onTap: Get.back,
            child: Icon(Icons.close, color: Colors.grey, size: 20),
          ),
        ],
      ).pOnly(bottom: 6),
    );
  }

  static void showSuccess(String message, {bool isClose = true}) {
    if ((Get.isDialogOpen ?? false) && isClose) Get.back();
    Get.snackbar(
      'success'.tr,
      message,
      borderWidth: 0,
      borderRadius: 8,
      overlayBlur: .1,
      overlayColor: Colors.black26,
      backgroundColor: AppColors.green5,
      animationDuration: 0.45.seconds,
      reverseAnimationCurve: Curves.easeOutExpo,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      margin: EdgeInsets.zero,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: Get.width - 32,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      titleText: SizedBox.shrink(),
      messageText: Row(
        children: [
          SvgPicture.asset('assets/icons/ic_success.svg'),
          SizedBox(width: 8),
          Text(
            message,
            style: AppTextStyles.normalTextW500(color: Colors.white),
          ).expand(),
          GestureDetector(
            onTap: Get.back,
            child: Icon(Icons.close, color: Colors.grey, size: 20),
          ),
        ],
      ).pOnly(bottom: 6),
    );
  }

  /// --- Authentication ---
  static void setTokenAndTimeOut(LoginResponse res) {
    //DateTime expirationDate = JwtDecoder.getExpirationDate(model.accessToken);
    DateTime expirationDate = DateTime.now().add(Duration(minutes: 30));
    final storage = Get.find<StorageService>();

    storage.saveAccessToken(res.accessToken);
    storage.saveRefreshToken(res.refreshToken);
    storage.saveTokenTimeout(expirationDate.toString());
  }

  static bool validateTokenTimeout() {
    final storage = Get.find<StorageService>();

    String tokenTimeout = storage.getTokenTimeout();
    if (tokenTimeout.isEmpty) return false;

    DateTime now = DateTime.now().add(Duration(minutes: 3));

    //Check current time <= timeout return false
    DateTime? timeOut = DateTime.tryParse(tokenTimeout);
    return timeOut!.isAfter(now);
  }

  static void logout({bool showMess = false})  {
    final storage = Get.find<StorageService>();
    if (Get.isDialogOpen ?? false) Get.back();

    storage.saveAccessToken('');
    storage.saveRefreshToken('');
    storage.saveTokenTimeout('');
    Get.offAllNamed(AppRoutes.login);

    Future.delayed(Duration(seconds: 1), () {
      if (showMess && !(Get.isDialogOpen ?? false)) {
        showError('msg_session_timeout');
      }
    });
  }
}
