import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferencesAsync;
import 'package:watch_it/watch_it.dart';

import '../../log/uistate/logger.dart' show log;
import '../engine/analyzor.dart' show Analyzor;
import '../engine/exif_analyzor.dart';
import '../engine/regex_analyzor.dart';

class AnalyzorList extends ChangeNotifier {
  AnalyzorList() {
    _loadPreferences();
  }

  static const _analyzorListKey = "analyzor_list";

  final SharedPreferencesAsync prefs =
      SharedPreferencesAsync();

  void _loadPreferences() async {
    try {
      final listJson = await prefs.getString(
        _analyzorListKey,
      );
      if (listJson != null) {
        final analyzorList = MapperContainer.globals
            .fromJson<List<Analyzor>>(listJson);
        setAnalyzors(analyzorList);
      } else {
        log(
          "Info: No analyzor_list available. Use current list.",
        );
      }
    } catch (e) {
      log("Error while loading preferences: $e");
    }
  }

  List<Analyzor> _analyzors = _defaultAnalyzors;

  static final List<Analyzor> _defaultAnalyzors = [
    ExifAnalyzor(enabled: true),
    RegExAnalyzor(
      regex: RegExp(
        r"(?<year>\d\d\d\d)(?<month>\d\d)(?<day>\d\d)_(?<hour>\d\d)(?<minute>\d\d)(?<second>\d\d)",
      ),
      enabled: true,
      //analyzorName: "MP4-DefaultFileName",
    ),
  ];

  List<Analyzor> get analyzors => _analyzors;

  /// Stores analyzors in SharedPreferences
  void _write2Prefs() async {
    final jsonList = MapperContainer.globals.toJson(
      _analyzors,
    );
    await prefs.setString(_analyzorListKey, jsonList);
  }

  void setAnalyzors(List<Analyzor> analyzorList) {
    _analyzors = analyzorList;
    notifyListeners();
    _write2Prefs();
  }

  void enableAnalyzor({
    required int analyzorNr,
    bool enabled = false,
  }) {
    final analyzor = analyzors[analyzorNr];
    analyzor.enabled = enabled;
    notifyListeners();
    _write2Prefs();
  }
}

/// should be called in main()
void registerAnalyzorList() {
  GetIt.instance.registerSingleton(AnalyzorList());
}
