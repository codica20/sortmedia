import 'package:flutter/material.dart';
import 'package:sortmedia/features/analyze/uistate/running_state.dart';
import 'package:watch_it/watch_it.dart';

import '../../../l10n/app_localizations.dart'
    show AppLocalizations;
import '../../show_message/ui/show_message.dart';
import '../engine/analyze_runner.dart';
import '../../settings/uistate/settings_state.dart';
import '../../log/uistate/logger.dart' show log;
import '../uistate/analyzor_list.dart' show AnalyzorList;

class AnalyzeButton extends WatchingWidget {
  const AnalyzeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final analyzors = watchIt<AnalyzorList>().analyzors;

    getTranslation() => AppLocalizations.of(context)!;
    return OutlinedButton(
      onPressed: () async {
        log("Analysiere ${settingsState.srcDir} ...");
        final String? srcDir = settingsState.srcDir;
        if (srcDir != null) {
          try {
            final runner = AnalyzeRunner(analyzors, srcDir);

            runningStateListener() {
              if (getRunningState() == .aborting) {
                runner.abort();
              }
            }

            final runningState =
                GetIt.instance<RunningStateModel>()
                    .runningState;

            runningState.addListener(runningStateListener);
            try {
              setRunningState(.running);
              final dirData = await runner.analyze();
              runningState.removeListener(
                runningStateListener,
              );
              setRunningState(.idle);
              if (context.mounted) {
                showMessage(
                  context,
                  "${dirData.aborted ? "ABGEBROCHEN: " : ""}"
                  "${dirData.recognized.length} Dateien"
                  " erkannt, ${dirData.notRecognized.length} nicht"
                  " erkannt.",
                );
              } else {  //TODO: how to show snackbar without context?
                log(
                  "ERROR: no context in AnalyzeButton!!!!",
                );
              }
            } finally {
              runningState.removeListener(
                runningStateListener,
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
            "Quellverzeichnis nicht gesetzt.", // TODO: l10n
          );
        }
      },
      child: Text(getTranslation().analyze),
    );
  }
}
