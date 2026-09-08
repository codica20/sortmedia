import 'package:material_ui/material_ui.dart';
import 'package:get_it/get_it.dart';

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

/// This function should be called by main().
/// After that you can call log();
///
void registerLogger() {
  GetIt.instance.registerSingleton(Logger());
}

/// This method logs msg. You can only call it
/// after the registerLogger() has been called.
void log(String msg) {
  GetIt.instance<Logger>().log(msg);
}
