import 'package:flutter/material.dart';

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
        if (context.mounted) {
                showMessage(
                  context,
                  getTranslation().aborting_message,
                );
              }
      },
      child: Text(getTranslation().abort_button),
    );
  }
}
