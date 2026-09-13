import 'dart:io';

import 'analyzor.dart';

import '../../log/uistate/logger.dart';

class AnalyzeDirData({
  required final List<AnalyzeData> recognized,

  /// contains paths of the unclassified files,
  /// which should be copied to the OTHERS directory.
  required final List<String> notRecognized,

  final bool aborted = false,
});

class AnalyzeRunner(
  final List<Analyzor> analyzors,
  final String path,
) {
  bool _aborted = false;

  /// analyzes the files at the current
  Future<AnalyzeDirData> analyze() async {
    _aborted = false;
    return await _analyzeDir(analyzors, path);
  }

  /// if process is running, it will be aborted after
  /// the current analysis has been completed
  void abort() {
    _aborted = true;
  }

  /// recursively analyzes the files in this directory
  ///
  Future<AnalyzeDirData> _analyzeDir(
    List<Analyzor> analyzors,
    String path,
  ) async {
    List<AnalyzeData> recognized = [];
    List<String> notRecognized = [];
    final dir = Directory(path);
    if (_aborted) {
      return AnalyzeDirData(
        recognized: recognized,
        notRecognized: notRecognized,
        aborted: true,
      );
    }
    log("Analysiere Verzeichnis $dir ...");
    final files = dir.list(recursive: true);

    await for (var entity in files) {
      if (_aborted) {
        return AnalyzeDirData(
          recognized: recognized,
          notRecognized: notRecognized,
          aborted: true,
        );
      }
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
    return AnalyzeDirData(
      recognized: recognized,
      notRecognized: notRecognized,
    );
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
}
