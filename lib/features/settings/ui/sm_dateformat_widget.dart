import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:watch_it/watch_it.dart';

import '../../../l10n/app_localizations.dart';
import '../uistate/date_format_state.dart';
import 'setting_base_widget.dart';

class SmDateformatWidget extends StatelessWidget {
  const SmDateformatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.instance<DateFormatState>()
        .dateformatEditingController;
    return SettingBaseWidget(
      child: Wrap(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!
                  .dateFormatLabelText,
            ),
            autocorrect: false,
            controller: controller,
          ),
          _DateFormatExampleWidget(),
        ],
      ),
    );
  }
}

class _DateFormatExampleWidget extends WatchingWidget {
  @override
  Widget build(BuildContext context) {
    final dateFormat = watchValue(
      (DateFormatState s) => s.dateformatEditingController,
    ).text;
    return Text(
      AppLocalizations.of(context)!.example(
        DateFormat(dateFormat).format(DateTime.now()),
      ),
    );
  }
}
