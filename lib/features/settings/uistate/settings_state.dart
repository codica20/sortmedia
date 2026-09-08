import 'package:material_ui/material_ui.dart';
import 'package:path/path.dart' show join;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_it/watch_it.dart';

class SettingsState extends ChangeNotifier {
  static final _srcDirKey = "src_dir";
  static final _destDirKey = "dest_dir";
  static final _otherDirKey = "other_dir";
  static final _defaultOtherName = "OTHERS";

  final SharedPreferencesAsync prefs =
      SharedPreferencesAsync();

  SettingsState() {
    _loadPreferences();
  }

  void _loadPreferences() async {
    srcDir = await prefs.getString(_srcDirKey);
    destDir = await prefs.getString(_destDirKey);
    otherDir = await prefs.getString(_otherDirKey);
  }

  String? _srcDir;
  String? _destDir;
  String? _otherDir;

  String? get srcDir => _srcDir;
  String? get destDir => _destDir;
  String? get otherDir => _otherDir;

  set srcDir(String? path) {
    _srcDir = path;
    _setDir(_srcDirKey, path);
  }

  set destDir(String? path) {
    _destDir = path;
    _setDir(_destDirKey, path);
    if (_otherDir == null && path != null) {
      otherDir = join(path, _defaultOtherName);
    }
  }

  set otherDir(String? path) {
    _otherDir = path;
    _setDir(_otherDirKey, path);
  }

  void _setDir(String key, String? path) {
    notifyListeners();
    if (path is String) {
      prefs.setString(key, path);
    } else {
      prefs.remove(key);
    }
  }
}

void registerSettingsState() {
  GetIt.instance.registerSingleton(SettingsState());
}

SettingsState get settingsState {
  return GetIt.instance<SettingsState>();
}
