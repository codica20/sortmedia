import 'dart:io' show File;

/// An Analyzor tres to
abstract class Analyzor {
  /// name of the analyzor
  String get name;

  /// set false to disable Analyzor
  bool enabled = true;

  /// If analyzor succeds, it returns analyzed data
  Future<AnalyzeData?> analyzeFile(File file);
}

class AnalyzeData {
  AnalyzeData(
    this.analyzorName,
    this.srcPath,
    this.dateTime,
  );

  @override
  String toString() {
    return "${getYear()}/${getMonth()}: $srcPath by $analyzorName";
  }

  final String analyzorName;
  final String srcPath;
  final DateTime dateTime;
  String getYear() => dateTime.year.toString();
  String getMonth() {
    final shortStr = dateTime.month.toString();
    return shortStr.padLeft(2, '0');
  }
}
