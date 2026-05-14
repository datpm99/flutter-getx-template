import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/data/services/storage_service.dart';
import 'en/auth_en.dart';
import 'en/common_en.dart';
import 'en/message_en.dart';
import 'vi/auth_vi.dart';
import 'vi/common_vi.dart';
import 'vi/message_vi.dart';

class TranslationService extends Translations {
  static const fallbackLocale = Locale('vi', 'VN');

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {...authEn, ...commonEn, ...messageEn},
    'vi_VN': {...authVi, ...commonVi, ...messageVi},
  };
}

class LanguageService extends GetxService {
  final _storage = Get.find<StorageService>();
  late Locale locale;

  Future<void> init() async {
    final language = await _storage.getLanguage();
    if (language.isNotEmpty && language.contains('_')) {
      var loc = language.split('_');
      locale = Locale(loc[0], loc[1]);
    } else {
      locale = TranslationService.fallbackLocale;
    }
  }

  void changeLanguage(String langCode, String countryCode) {
    locale = Locale(langCode, countryCode);
    _storage.saveLanguage('${langCode}_$countryCode');
    Get.updateLocale(locale);
  }
}
