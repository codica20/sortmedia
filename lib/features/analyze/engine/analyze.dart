import 'dart:io';

import 'regex_analyzor.dart';

import 'analyzor.dart';
import 'exif_analyzor.dart';

import '../../log/uistate/logger.dart';

final List<Analyzor> analyzors = [
  ExifAnalyzor(),
  RegExAnalyzor(
    regex: RegExp(
      r"(?<year>\d\d\d\d)(?<month>\d\d)(?<day>\d\d)_(?<hour>\d\d)(?<minute>\d\d)(?<second>\d\d)",
    ),
    //analyzorName: "MP4-DefaultFileName",
  ),
];

class AnalyzeDirData {
  AnalyzeDirData(this.recognized, this.notRecognized);
  List<AnalyzeData> recognized;
  List<String> notRecognized;
}

/// recursively analyzes the files in this directory
///
Future<AnalyzeDirData> analyzeDir(String path) async {
  List<AnalyzeData> recognized = [];
  List<String> notRecognized = [];
  final dir = Directory(path);
  log("Analysiere Verzeichnis $dir ...");
  final files = dir.list(recursive: true);

  await for (var entity in files) {
    if (entity is File) {
      final fileData = await _analyzeFile(entity);
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
