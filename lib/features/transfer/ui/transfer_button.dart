import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sortmedia/features/settings/uistate/date_format_state.dart';

import '../../../l10n/app_localizations.dart'
    show AppLocalizations;
import '../../analyze/uistate/analyzor_list.dart'
    show AnalyzorList;
import '../../analyze/uistate/running_state.dart';
import '../engine/transfer_runner.dart';

import 'package:watch_it/watch_it.dart';

import '../../show_message/ui/show_message.dart';

import '../../analyze/engine/analyze_runner.dart';
import '../../settings/uistate/settings_state.dart';
import '../../log/uistate/logger.dart' show log;

class TransferButton extends WatchingWidget {
  const TransferButton({super.key});

  @override
  Widget build(BuildContext context) {
    final analyzors = watchIt<AnalyzorList>().analyzors;
    final dateFormat = watchValue(
      (DateFormatState s) => s.dateformatEditingController,
    ).text;

    getTranslation() => AppLocalizations.of(context)!;
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
          final analyzeRunner = AnalyzeRunner(
            analyzors,
            srcDir,
          );

          void analyzingStateListener() {
            if (getRunningState() == .aborting) {
              analyzeRunner.abort();
            }
          }

          final runningState =
              GetIt.instance<RunningStateModel>()
                  .runningState;

          runningState.addListener(analyzingStateListener);
          try {
            setRunningState(.running);
            final dirData = await analyzeRunner.analyze();
            runningState.removeListener(
              analyzingStateListener,
            );

            final transferRunner = TransferRunner(
              dirData,
              destDir,
              otherDir,
              DateFormat(dateFormat),
            );

            void transferStateListener() {
              if (getRunningState() == .aborting) {
                transferRunner.abort();
              }
            }

            runningState.addListener(transferStateListener);
            try {
              final transferResult = await transferRunner
                  .transfer();
              setRunningState(.idle);

              showMessage(
                null,
                "${dirData.aborted || transferResult.aborted ? "ABGEBROCHEN: " : ""}" // TODO: l10n
                "${dirData.recognized.length} Dateien"
                " erkannt - davon ${transferResult.recognizedCopies} kopiert."
                "${dirData.notRecognized.length} nicht"
                " erkannt - davon ${transferResult.notRecognizedCopies}"
                " kopiert.",
              );
            } finally {
              runningState.removeListener(
                transferStateListener,
              );
            }
          } finally {
            runningState.removeListener(
              analyzingStateListener,
            );
          }
        } catch (e) {
          showMessage(null, "Fehler beim Kopieren: $e");
        }
      },
      child: Text(getTranslation().copy),
    );
  }
}
