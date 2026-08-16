import 'package:flutter/material.dart';
import 'package:sort_media/features/log/uistate/logger.dart';

class LogsViewWidget extends StatelessWidget {
  const LogsViewWidget({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: logger,
      builder: (context, child) {
        final int len = logger.logs.length;
        final String heading = "logs ($len)";
        return Column(
          mainAxisSize: .min,
          crossAxisAlignment: .stretch,
          children: [
            Text(heading),
            SizedBox.fromSize(
              size: Size.fromHeight(100),
              child: _LogItemsWidget(),
            ),
          ],
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
          itemBuilder: (context, index) => ListTile(
            title: Text(
              '${logger.logs.length} -${logger.logs[len - index - 1]}',
            ),
          ),
        );
      },
    );
  }
}
