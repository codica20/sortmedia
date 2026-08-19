import 'package:flutter/material.dart';
import 'package:sort_media/features/log/ui/log_item_widget.dart';
import 'package:sort_media/features/log/uistate/logger.dart';
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
    return Padding(
      padding: .all(20),

      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Container(
            color: theme.colorScheme.primaryContainer,
            child: Text(
              heading,
              style: theme.textTheme.headlineMedium,
            ),
          ),
          Expanded(child: _LogItemsWidget()),
        ],
      ),
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
