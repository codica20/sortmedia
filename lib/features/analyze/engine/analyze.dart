import 'dart:io';

import 'analyzor.dart';

import '../../log/uistate/logger.dart';

class AnalyzeDirData {
  AnalyzeDirData(this.recognized, this.notRecognized);
  List<AnalyzeData> recognized;
  List<String> notRecognized;
}

/// recursively analyzes the files in this directory
///
Future<AnalyzeDirData> analyzeDir(
  List<Analyzor> analyzors,
  String path,
) async {
  List<AnalyzeData> recognized = [];
  List<String> notRecognized = [];
  final dir = Directory(path);
  log("Analysiere Verzeichnis $dir ...");
  final files = dir.list(recursive: true);

  await for (var entity in files) {
    if (entity is File) {
      final fileData = await _analyzeFile(
        analyzors,
        entity,
      );
      if (fileData != null) {
        recognized.add(fileData);
      } else {
        notRecognized.add(entity.path);
      }
    } else {
      log("$entity is not a File.");
    }
  }
  return AnalyzeDirData(recognized, notRecognized);
}

Future<AnalyzeData?> _analyzeFile(
  List<Analyzor> analyzors,
  FileSystemEntity entity,
) async {
  log("Analyzing file $entity ...");
  if (entity is File) {
    for (var analyzor in analyzors) {
      if (analyzor.enabled) {
        final data = await analyzor.analyzeFile(entity);
        if (data != null) {
          return data;
        }
      }
    }
    return null; // no Analyzor succeeded
  } else {
    throw FileSystemException("$entity is not a File.");
  }
}
