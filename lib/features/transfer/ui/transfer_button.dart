import 'package:flutter/material.dart';

import '../engine/transfer.dart';

import 'package:watch_it/watch_it.dart';

import '../../show_message/ui/show_message.dart';

import '../../analyze/engine/analyze.dart';
import '../../settings/state/settings_state.dart';
import '../../log/uistate/logger.dart' show log;

class TransferButton extends WatchingWidget {
  const TransferButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () async {
        log(
          "Kopiere von ${settingsState.srcDir}"
          " nach ${settingsState.destDir}...",
        );
        final String? srcDir = settingsState.srcDir;
        if (srcDir == null) {
          showMessage(
            context,
            "Quellverzeichnis nicht gesetzt.",
          );
          return;
        }
        final String? destDir = settingsState.destDir;
        if (destDir == null) {
          showMessage(
            context,
            "Zielverzeichnis nicht gesetzt.",
          );
          return;
        }
        final String? otherDir = settingsState.otherDir;
        if (otherDir == null) {
          showMessage(
            context,
            "Zielverzeichnis für unbekannte Dateien nicht gesetzt.",
          );
          return;
        }
        try {
          final dirData = await analyzeDir(srcDir);

          for (var data in dirData.recognized) {
            log("rcgnzd: $data");
          }
          for (var data in dirData.notRecognized) {
            log("no: $data");
          }

          final transferResult = await transferFiles(
            dirData,
            destDir,
            otherDir,
          );
          if (context.mounted) {
            showMessage(
              context,
              "${dirData.recognized.length} Dateien"
              " erkannt - davon ${transferResult.recognizedCopies} kopiert."
              "${dirData.notRecognized.length} nicht"
              " erkannt - davon ${transferResult.notRecognizedCopies}"
              " kopiert.",
            );
          }
        } catch (e) {
          if (context.mounted) {
            showMessage(
              context,
              "Fehler beim Kopieren: $e",
            );
          }
        }
      },
      child: Text("Kopieren"),
    );
  }
}
