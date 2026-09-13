import 'package:flutter/material.dart';
import 'package:sortmedia/features/analyze/ui/abort_button.dart';
import 'package:sortmedia/features/analyze/uistate/running_state.dart';
import 'package:sortmedia/features/choose_lang/ui/lang_setter.dart';
import 'package:sortmedia/l10n/app_localizations.dart';
import 'package:watch_it/watch_it.dart';

import '../../navigation/ui/nav_bar.dart';

import '../../analyze/ui/analyze_button.dart';
import '../../log/ui/logs_view_widget.dart';
import '../../settings/ui/settings_widget.dart';
import '../../transfer/ui/transfer_button.dart';
import 'sm_scaffold.dart' show defaultPadding;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context)
        .size
        .height;
    final ColorScheme colorScheme = Theme.of(context)
        .colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.inversePrimary,
        title: Text(title),
        actions: [LangSetter()],
      ),
      body: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Expanded(
            //  SizedBox(
            //    height: (screenHeight * 1 / 3),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  defaultPadding(SettingsWidget()),
                ],
              ),
            ),
          ),
          defaultPadding(_SmRunningButtons()
          ),
          SizedBox(
            height: screenHeight / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadiusGeometry.directional(
                      topStart: Radius.circular(15),
                      topEnd: Radius.circular(15),
                    ),
                color: colorScheme.secondaryContainer,
              ),
              child: LogsViewWidget(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

class _SmRunningButtons extends WatchingWidget {
  @override
  Widget build(BuildContext context) {
    final runningState = watchValue(
      (RunningStateModel rs) => rs.runningState,
    );

    return switch (runningState) {
      .idle => Row(
        mainAxisAlignment: .spaceBetween,
        children: [AnalyzeButton(), TransferButton()],
      ),
      .running => Row(
        mainAxisAlignment: .end,
        children: [AbortButton()],
      ),
      .aborting => Text(
        AppLocalizations.of(context)!.aborting_message,
      ),
    };
  }
}
