import 'package:flutter/material.dart';
import 'package:sort_media/features/log/ui/log_item_widget.dart';
import 'package:sort_media/features/log/uistate/logger.dart';

class LogsViewWidget extends StatelessWidget {
  const LogsViewWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: logger,
      builder: (context, child) {
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
                child: Text(heading, style: theme.textTheme.headlineMedium),
              ),
              Expanded(child: _LogItemsWidget()),
            ],
          ),
        );
      },
    );
  }
}

class _LogItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final len = logger.logs.length;
    return ListenableBuilder(
      listenable: logger,
      builder: (context, child) {
        return ListView.builder(
          itemCount: len,
          itemBuilder: (context, index) => LogItemWidget(
            logger.logs[len - index - 1],
            key: Key("log-$index"),
          ),
        );
      },
    );
  }
}
