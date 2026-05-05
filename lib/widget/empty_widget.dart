import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/core/extensions/widget_ext.dart';
import '/core/theme/app_text_styles.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, this.text = 'list_empty'});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text.tr, style: AppTextStyles.bigTextW700()).pSymmetric(v: 35),
        Image.asset('assets/images/no_data.png').expand(),
      ],
    );
  }
}
