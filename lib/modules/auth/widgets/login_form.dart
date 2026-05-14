import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/theme/app_colors.dart';
import '/core/utils/app_validator.dart';
import '/modules/auth/controllers/login_controller.dart';
import '/widget/buttons/elevated_button_widget.dart';
import '/widget/text_field_widget.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              TextFieldWidget(
                ctrl: controller.usernameController,
                textInputAction: TextInputAction.next,
                validateMode: AutovalidateMode.onUserInteraction,
                validator: (val) => AppValidator.empty(val, 'username'),
                hintText: 'enter_username'.tr,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                ctrl: controller.passwordController,
                textInputAction: TextInputAction.done,
                validateMode: AutovalidateMode.onUserInteraction,
                validator: (val) => AppValidator.empty(val, 'password'),
                hintText: 'enter_password'.tr,
                isPassWord: true,
              ),
              SizedBox(height: 30),
              ElevatedButtonWidget(
                width: Get.width,
                text: 'login',
                bgColor: AppColors.primaryColor,
                onTap: () => controller.onLogin(context),
              ),
            ],
          );
        },
      ),
    );
  }
}
