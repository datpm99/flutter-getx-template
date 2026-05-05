import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '/core/extensions/widget_ext.dart';
import '/core/theme/app_colors.dart';
import '/core/theme/app_text_styles.dart';
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
            style: AppTextStyles.normalText(color: AppColors.red5),
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
  // static void setTokenAndTimeOut(LoginModel model) {
  //   //DateTime expirationDate = JwtDecoder.getExpirationDate(model.accessToken);
  //   DateTime expirationDate = DateTime.now().add(const Duration(minutes: 150));
  //
  //   storage.accessToken = model.accessToken;
  //   storage.refreshToken = model.refreshToken;
  //   storage.tokenTimeout = expirationDate.toString();
  // }

  // static bool validateTokenTimeout() {
  //   if (storage.tokenTimeout.isEmpty) return false;
  //   DateTime now = DateTime.now().add(const Duration(minutes: 3));
  //
  //   //Check current time <= timeout return false
  //   DateTime? timeOut = DateTime.tryParse(storage.tokenTimeout);
  //   return timeOut!.isAfter(now);
  // }

  // static void logout({bool showMess = false}) async {
  //   if (Get.isDialogOpen!) Get.back();
  //   //if (storage.accessToken.isEmpty) return;
  //   storage.accessToken = '';
  //   storage.refreshToken = '';
  //   storage.tokenTimeout = '';
  //   Get.offAllNamed(Routes.signIn);
  //
  //   Future.delayed(const Duration(seconds: 1), () {
  //     if (showMess && !Get.isDialogOpen!) showError('msg_session_timeout');
  //   });
  // }
}
