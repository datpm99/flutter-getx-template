import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/theme/app_text_styles.dart';
import '/modules/auth/controllers/login_controller.dart';
import '/modules/auth/widgets/login_form.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30),
              Image.asset('assets/images/logo.png', height: 150),
              SizedBox(height: 30),
              Text('login'.tr, style: AppTextStyles.normalTextW700(size: 24)),
              SizedBox(height: 30),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
