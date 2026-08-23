import 'package:flutter/material.dart';
import '../../show_message/ui/show_message.dart';

import '../engine/analyze.dart';
import '../../settings/state/settings_state.dart';

import 'package:watch_it/watch_it.dart';

import '../../log/uistate/logger.dart' show log;

class AnalyzeButton extends WatchingWidget {
  const AnalyzeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        log("Analysiere ${settingsState.srcDir} ...");
        final String? srcDir = settingsState.srcDir;
        if (srcDir != null) {
          try {
            final dirData = await analyzeDir(srcDir);

            for (var data in dirData.recognized) {
              log("rcgnzd: $data");
            }
            for (var data in dirData.notRecognized) {
              log("no: $data");
            }
            if (context.mounted) {
              showMessage(
                context,
                "${dirData.recognized.length} Dateien"
                " erkannt, ${dirData.notRecognized.length} nicht"
                " erkannt",
              );
            }
          } catch (e) {
            if (context.mounted) {
              showMessage(
                context,
                "Fehler beim Analysieren: $e",
              );
            }
          }
        } else {
          showMessage(
            context,
            "Quellverzeichnis nicht gesetzt.",
          );
        }
      },
      child: Text("Analysiere"),
    );
  }
}
