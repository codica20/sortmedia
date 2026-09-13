import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'package:sortmedia/features/analyze/uistate/running_state.dart';

import '../../../l10n/app_localizations.dart'
    show AppLocalizations;
import '../../show_message/ui/show_message.dart';
import '../../log/uistate/logger.dart' show log;

class AbortButton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    getTranslation() => AppLocalizations.of(context)!;
    return OutlinedButton(
      onPressed: () async {
        log(getTranslation().aborting_message);
        GetIt.instance<RunningStateModel>()
                .runningState
                .value =
            .aborting;
        showMessage(
          context,
          getTranslation().aborting_message,
        );
      },
      child: Text(getTranslation().abort_button),
    );
  }
}
