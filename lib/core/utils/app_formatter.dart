import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/lang/translation_service.dart';

class AppFormatter {
  /// --- Date picker ---
  static Future<DateTime?> datePicker(dynamic ctx, {DateTime? initDate}) async {
    final lang = Get.find<LanguageService>();
    return await showDatePicker(
      locale: lang.locale,
      context: ctx,
      initialDate: initDate,
      firstDate: DateTime.now().subtract(Duration(days: 365 * 10)),
      lastDate: DateTime.now().add(Duration(days: 365 * 10)),
    );
  }

  // --- DateTime to String ---
  static String dateToStr1(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }

  static String dateToStr2(DateTime date) {
    return DateFormat("HH:mm dd/MM/yyyy").format(date);
  }

  // --- String to DateTime ---
  static DateTime strToDate1(String date) {
    return DateFormat("dd/MM/yyyy").parse(date);
  }

  // --- DateTime Utc to Local ---
  static DateTime utcToLocal1(String dateUtc) {
    DateTime date = DateFormat("yyyy-MM-ddTHH:mm:sssZ").parse(dateUtc, true);
    return date.toLocal();
  }

  static String utcToLocal2(String dateUtc) {
    if (dateUtc.isEmpty) return '';
    final date = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateUtc, true);
    return DateFormat("dd/MM/yyyy").format(date.toLocal());
  }

  // --- DateTime Local to Utc ---
  static String localToUtc1(DateTime date) {
    return DateFormat("yyyy-MM-ddTHH:mm:sssZ").format(date);
  }

  // --- Other ---
  static String millisecondToStr(int value) {
    final date = DateTime.fromMillisecondsSinceEpoch(value);
    return DateFormat('HH:mm dd/MM/yyyy').format(date);
  }

  /// --- Time picker ---
  static Future<TimeOfDay?> timePicker(BuildContext ctx, TimeOfDay time) async {
    final lang = Get.find<LanguageService>();
    return await showTimePicker(
      initialTime: time,
      context: ctx,
      builder: (context, child) {
        if (MediaQuery.of(context).alwaysUse24HourFormat) {
          return child!;
        } else {
          return Localizations.override(
            context: context,
            locale: lang.locale,
            child: child,
          );
        }
      },
    );
  }

  // --- Format time ---
  static String formatTime1(DateTime date) {
    return DateFormat("HH:mm").format(date);
  }
}
