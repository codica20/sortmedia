import 'package:flutter/material.dart';

typedef LogItem = String;

class Logger extends ChangeNotifier {
  final List<LogItem> _logs = ["Erster Eintrag"];

  void log(String msg) {
    _logs.add(msg);
    notifyListeners();
  }

  List<LogItem> get logs => _logs;
}

/// The app wide logger. You can always
/// call logger.log(msg)
Logger logger = Logger();
