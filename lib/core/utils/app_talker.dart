import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppTalker {
  static final talker = TalkerFlutter.init(
    settings: TalkerSettings(enabled: !kReleaseMode),
    logger: TalkerLogger(
      settings: TalkerLoggerSettings(
        enableColors: false, // Tắt màu để tránh lỗi hiển thị ký tự lạ trên console Android Studio
      ),
    ),
  );

  ///--- Logs ---
  static void info(String msg) => talker.info(msg);

  static void warning(String msg) => talker.warning(msg);

  static void debug(String msg) => talker.debug(msg);

  static void error(String msg) => talker.error(msg);

  static void screenLogs() {
    BuildContext? context = Get.context;
    if (context == null) return;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TalkerScreen(talker: talker)),
    );
  }
}
