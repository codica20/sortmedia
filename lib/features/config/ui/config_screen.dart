import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

import 'analyzors_view.dart';
import '../../home/ui/sm_scaffold.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;
    return SmScaffold(
      title: translations.configScreenName,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          defaultPadding(
            Text(
              'Die "Analysierer" werden - sofern aktiviert'
              ' (Häkchen gesetzt) - in folgender '
              'Reihenfolge für jede Datei abgefragt. '
              'Der erste "Analysierer", der das Datum '
              'des Mediums erkennt, entscheidet.',
            ),
          ),
          Expanded(child: AnalyzorsView()),
        ],
      ),
    );
  }
}
