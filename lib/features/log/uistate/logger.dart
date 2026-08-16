import 'package:flutter/material.dart';

class LogItem {
  final String _msg;
  LogItem(this._msg);
  String get message => _msg;
}

class Logger extends ChangeNotifier {
  final List<LogItem> _logs = [];

  void log(String msg) {
    _logs.add(LogItem(msg));
    notifyListeners();
  }

  List<LogItem> get logs => _logs;
}

/// The app wide logger. You can always
/// call logger.log(msg)
Logger logger = Logger();
