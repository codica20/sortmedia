import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

import 'logs_view_widget.dart';
import '../../navigation/ui/nav_bar.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final translations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(translations.logsScreenName),
        backgroundColor: Theme.of(context)
            .colorScheme
            .secondary,
      ),
      body: LogsViewWidget(),
      bottomNavigationBar: NavBar(),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('Go back!'),
      ),
    );
  }
}
