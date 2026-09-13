import 'package:flutter/material.dart';

import '../../log/uistate/logger.dart' show log;

void showMessage(BuildContext? context, String msg) {
  if (context != null && context.mounted) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  } else {
    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }
  log("Msg: $msg");
}

final GlobalKey<ScaffoldMessengerState>
scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
