import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/theme/app_colors.dart';
import '/core/theme/app_decoration.dart';
import '/core/theme/app_text_styles.dart';
import '/core/utils/app_validator.dart';
import '/modules/auth/controllers/login_controller.dart';
import '/widget/buttons/elevated_button_widget.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              TextFormField(
                controller: controller.usernameController,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) => AppValidator.empty(val, 'username'),
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'enter_username'.tr,
                  hintStyle: AppTextStyles.normalText(color: Colors.grey),
                  border: AppDecoration.inputBorder(),
                  enabledBorder: AppDecoration.inputBorder(),
                  focusedBorder: AppDecoration.inputBorder(
                    color: Colors.lightBlueAccent,
                  ),
                  focusedErrorBorder: AppDecoration.inputBorder(
                    color: Colors.redAccent,
                  ),
                  errorBorder: AppDecoration.inputBorder(
                    color: Colors.redAccent,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                return TextFormField(
                  controller: controller.passwordController,
                  textInputAction: TextInputAction.done,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) => AppValidator.empty(val, 'password'),
                  obscureText: !controller.showPassword.value,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'enter_password'.tr,
                    hintStyle: AppTextStyles.normalText(color: Colors.grey),
                    border: AppDecoration.inputBorder(),
                    enabledBorder: AppDecoration.inputBorder(),
                    focusedBorder: AppDecoration.inputBorder(
                      color: Colors.lightBlueAccent,
                    ),
                    focusedErrorBorder: AppDecoration.inputBorder(
                      color: Colors.redAccent,
                    ),
                    errorBorder: AppDecoration.inputBorder(
                      color: Colors.redAccent,
                    ),
                    suffixIcon: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: controller.changedShowPassword,
                      child: Icon(
                        (controller.showPassword.value)
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.black.withValues(alpha: 0.25),
                      ),
                    ),
                  ),
                );
              }),
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
