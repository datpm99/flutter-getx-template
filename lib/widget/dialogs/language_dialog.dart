import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/extensions/widget_ext.dart';
import '/core/theme/app_decoration.dart';
import '/core/theme/app_text_styles.dart';
import '/lang/translation_service.dart';
import '/widget/buttons/elevated_button_widget.dart';

class LanguagesDialog extends StatefulWidget {
  const LanguagesDialog({super.key});

  @override
  State<LanguagesDialog> createState() => _LanguagesDialogState();
}

class _LanguagesDialogState extends State<LanguagesDialog> {
  String language = 'vi';

  void onChangedLanguage(String? val) {
    language = val!;
    setState(() {});
  }

  void saveChangedLanguage() {
    final lang = Get.find<LanguageService>();
    if (language == 'vi') {
      lang.changeLanguage('vi', 'VN');
    } else {
      lang.changeLanguage('en', 'US');
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: AppDecoration.borderDialog(radius: 16),
      insetPadding: EdgeInsets.all(28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Title.
          Text('language'.tr, style: AppTextStyles.bigTextW700()).p(15),
          Divider(height: 1, thickness: 0.5, color: Color(0xff9FA2B4)),

          //
          SizedBox(height: 15),
          RadioGroup<String>(
            groupValue: language,
            onChanged: onChangedLanguage,
            child: Column(
              children: <Widget>[
                RadioListTile<String>(
                  title: Row(
                    children: [
                      Image.asset(
                        'assets/icons/ic_flag_vn.png',
                        width: 28,
                        height: 28,
                      ),
                      SizedBox(width: 10),
                      Text('lang_vi'.tr, style: AppTextStyles.normalTextW500()),
                    ],
                  ),
                  value: 'vi',
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                RadioListTile<String>(
                  title: Row(
                    children: [
                      Image.asset(
                        'assets/icons/ic_flag_us.png',
                        width: 28,
                        height: 28,
                      ),
                      SizedBox(width: 10),
                      Text('lang_us'.tr, style: AppTextStyles.normalTextW500()),
                    ],
                  ),
                  value: 'en',
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
              ],
            ),
          ),

          //
          Divider(
            height: 1,
            thickness: 0.5,
            color: Color(0xff9FA2B4),
          ).pOnly(top: 15, bottom: 20),

          Row(
            children: [
              ElevatedButtonWidget(
                text: 'cancel',
                elevation: 0,
                bgColor: Colors.black.withValues(alpha: 0.06),
                textStyle: AppTextStyles.mediumTextW700(),
                onTap: Get.back,
              ).expand(),
              SizedBox(width: 16),
              ElevatedButtonWidget(
                text: 'save',
                bgColor: Colors.green,
                onTap: saveChangedLanguage,
              ).expand(),
            ],
          ).pSymmetric(h: 12),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
