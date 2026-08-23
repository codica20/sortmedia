import 'package:flutter/material.dart';

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
            Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  'Folgende "Analysierer" werden in folgender Reihenfolge für jede Datei aufgerufen. Der erste "Analysierer", der das Datum des Mediums erkennt, gewinnt.',
                ),

                Text(
                  'In einer künftigen Version können die Analysierer verändert werden.',
                ),
              ],
            ),
          ),
          Expanded(child: AnalyzorsView()),
        ],
      ),
    );
  }
}
