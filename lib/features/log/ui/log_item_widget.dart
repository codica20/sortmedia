import 'package:flutter/material.dart';

import '../uistate/logger.dart';

class LogItemWidget extends StatelessWidget {
  final LogItem _item;
  const LogItemWidget(this._item, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(_item.message));
  }
}
