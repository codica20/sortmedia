import 'package:material_ui/material_ui.dart';

import '../../log/uistate/logger.dart' show log;

void showMessage(BuildContext context, String msg) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(msg)));
  log("Msg: $msg");
}
