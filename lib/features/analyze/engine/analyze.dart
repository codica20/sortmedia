import 'dart:io';

import 'analyzor.dart';
import 'exif_analyzor.dart';

import '../../log/uistate/logger.dart';

final analyzors = [ExifAnalyzor()];

class AnalyzeDirData {
  AnalyzeDirData(this.recognized, this.notRecognized);
  List<AnalyzeData> recognized;
  List<String> notRecognized;
}

Future<AnalyzeDirData> analyzeDir(String path) async {
  List<AnalyzeData> recognized = [];
  List<String> notRecognized = [];
  final dir = Directory(path);
  log("Analysiere Verzeichnis $dir ...");
  final files = dir.list(recursive: true);
  await for (var entity in files) {
    final fileData = await analyzeFile(entity);
    if (fileData != null) {
      recognized.add(fileData);
    } else {
      notRecognized.add(entity.path);
    }
  }
  return AnalyzeDirData(recognized, notRecognized);
}

Future<AnalyzeData?> analyzeFile(
  FileSystemEntity entity,
) async {
  log("Analyzing file $entity ...");
  if (entity is File) {
    for (var analyzor in analyzors) {
      final data = await analyzor.analyzeFile(entity);
      if (data != null) {
        return data;
      }
    }
    return null; // no Analyzor succeeded
  } else {
    throw FileSystemException("$entity is not a File.");
  }
}
