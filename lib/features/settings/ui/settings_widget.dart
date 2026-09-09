import 'package:flutter/material.dart';
import 'package:sortmedia/l10n/app_localizations.dart';
import 'package:watch_it/watch_it.dart';

import '../uistate/settings_state.dart';
import 'choose_dir_setting_widget.dart';

class SettingsWidget extends WatchingWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsState = watchIt<SettingsState>();
    getTranslation() => AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        ChooseDirSettingWidget(
          dirName: getTranslation().srcDir,
          dir: settingsState.srcDir,
          setDir: (String? dir) {
            settingsState.srcDir = dir;
          },
        ),
        ChooseDirSettingWidget(
          dirName: getTranslation().destDir,
          dir: settingsState.destDir,
          setDir: (String? dir) {
            settingsState.destDir = dir;
          },
        ),
        ChooseDirSettingWidget(
          dirName:
              getTranslation().unclassifiedDir,
          dir: settingsState.otherDir,
          setDir: (String? dir) {
            settingsState.otherDir = dir;
          },
        ),
      ],
    );
  }
}
