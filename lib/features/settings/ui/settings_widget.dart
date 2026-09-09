import 'package:flutter/material.dart';
import 'package:watch_it/watch_it.dart';

import '../uistate/settings_state.dart';
import 'choose_dir_setting_widget.dart';

class SettingsWidget extends WatchingWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsState = watchIt<SettingsState>();
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        ChooseDirSettingWidget(
          dirName: "Quellverzeichnis",
          dir: settingsState.srcDir,
          setDir: (String? dir) {
            settingsState.srcDir = dir;
          },
        ),
        ChooseDirSettingWidget(
          dirName: "Zielverzeichnis",
          dir: settingsState.destDir,
          setDir: (String? dir) {
            settingsState.destDir = dir;
          },
        ),
        ChooseDirSettingWidget(
          dirName:
              "Verzeichnis für unklassifizierte Dateien",
          dir: settingsState.otherDir,
          setDir: (String? dir) {
            settingsState.otherDir = dir;
          },
        ),
      ],
    );
  }
}
