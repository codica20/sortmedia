import 'dart:io' show File;

// import without "show" because of part  "analyzor.mapper.dart"
import 'package:dart_mappable/dart_mappable.dart';

part "analyzor.mapper.dart";

@MappableClass()
class MyClass with MyClassMappable {
  final bool myValue;

  MyClass(this.myValue);
}

/// An Analyzor tries to get a relevant date for
/// a given media file
@MappableClass(discriminatorKey: "type")
abstract class Analyzor with AnalyzorMappable {
  Analyzor({required this.enabled});

  /// name of the analyzor
  String getName();

  /// set false to disable Analyzor
  bool enabled;

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
    return "$dateTime: $srcPath by $analyzorName";
  }

  final String analyzorName;
  final String srcPath;
  final DateTime dateTime;
  
}
