import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../log/uistate/logger.dart';

class DateFormatState {
  static const String _dateFormatKey = "date_format";
  static const String _defaultDateFormat = "yyyy/MM";

  new({String? initialText})
    : dateformatEditingController = TextEditingController(
        text: initialText ?? _defaultDateFormat,
      ) {
    _loadPreferences().then((_) {
      dateformatEditingController.addListener(() {
        final dateFormat = dateformatEditingController.text;
        try {
          sharedPreferencesAsync.setString(
            _dateFormatKey,
            dateFormat,
          );
        } catch (e) {
          log(
            "Error: Writing dateFormat $dateFormat to "
            "shared preferences failed: $e",
          );
        }
      });
    });
  }
  final SharedPreferencesAsync sharedPreferencesAsync =
      SharedPreferencesAsync();
  final TextEditingController dateformatEditingController;

  Future<void> _loadPreferences() async {
    try {
      final dateFormat = await sharedPreferencesAsync
          .getString(_dateFormatKey);
      if (dateFormat is String) {
        dateformatEditingController.text = dateFormat;
      }
    } catch (e) {
      log("Error while loading date format: $e");
    }
  }

  /// should be registered after Logger
  static void registerSingleton() {
    GetIt.instance.registerSingleton(DateFormatState());
  }
}
