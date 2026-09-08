import 'package:material_ui/material_ui.dart';

import 'analyzors_view.dart';
import '../../home/ui/sm_scaffold.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmScaffold(
      title: "Konfiguration",
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
