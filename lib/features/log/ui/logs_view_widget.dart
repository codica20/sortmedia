import 'package:flutter/material.dart';

import 'log_item_widget.dart';
import '../uistate/logger.dart';

import 'package:watch_it/watch_it.dart';

/// shows the logs, newest at the top
class LogsViewWidget extends WatchingWidget {
  const LogsViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final logger = watchIt<Logger>();
    final theme = Theme.of(context);
    final int len = logger.logs.length;
    final String heading = "logs ($len)";
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),

            color: theme.colorScheme.primaryContainer,
          ),
          padding: .symmetric(vertical: 10, horizontal: 20),
          child: Text(
            heading,
            style: theme.textTheme.titleMedium,
          ),
        ),
        Expanded(child: _LogItemsWidget()),
      ],
    );
  }
}

class _LogItemsWidget extends WatchingWidget {
  @override
  Widget build(BuildContext context) {
    final logger = watchIt<Logger>();
    final len = logger.logs.length;
    return ListView.builder(
      itemCount: len,
      itemBuilder: (context, index) => LogItemWidget(
        logger.logs[len - index - 1],
        key: Key("log-$index"),
      ),
    );
  }
}
