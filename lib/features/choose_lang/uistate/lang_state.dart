
import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:get_it/get_it.dart' show GetIt;
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferencesAsync;

class LangState extends ChangeNotifier {
  static final _langKey = "lang";
  
  final SharedPreferencesAsync prefs =
      SharedPreferencesAsync();

  LangState() {
    _loadPreferences();
  }

  void _loadPreferences() async {
    lang = await prefs.getString(_langKey);
  }

  String? _lang;

  String? get lang => _lang;
  
  set lang(String? newLang) {
    _lang=newLang;
    notifyListeners();
    if (newLang is String) {
      prefs.setString(_langKey, newLang);
    } else {
      prefs.remove(_langKey);
    }
  }
}

/// this should be called in main()
void registerLangState() {
  GetIt.instance.registerSingleton(LangState());
}

LangState get langState {
  return GetIt.instance<LangState>();
}
