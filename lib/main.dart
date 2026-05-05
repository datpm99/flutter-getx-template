import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'core/constants/app_constants.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/app_talker.dart';
import 'data/services/storage_service.dart';
import 'lang/translation_service.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );

  // --- Init services ---
  Get.put(StorageService());
  Get.put(LanguageService());
  // await Get.put(BaseApi()).init();

  runZonedGuarded(
    () {
      FlutterError.onError = (details) {
        AppTalker.talker.handle(details.exception, details.stack);
      };

      runApp(MyApp());
    },
    (error, stack) {
      AppTalker.talker.handle(error, stack);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TalkerWrapper(
      talker: AppTalker.talker,
      options: TalkerWrapperOptions(
        enableErrorAlerts: true, // Shows SnackBars for errors
        enableExceptionAlerts: true, // Shows SnackBars for exceptions
      ),
      child: GetMaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('vi'), Locale('en')],
        enableLog: false,
        debugShowCheckedModeBanner: false,
        color: AppColors.primaryColor,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        title: AppConstants.appName,
        getPages: AppPages.routes,
        initialRoute: AppPages.getInitPage(),
        locale: Get.find<LanguageService>().locale,
        translations: TranslationService(),
        fallbackLocale: TranslationService.fallbackLocale,
        defaultTransition: Transition.fadeIn,
        navigatorObservers: [TalkerRouteObserver(AppTalker.talker)],
      ),
    );
  }
}
