import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path/path.dart' show basename, join;

import '../../analyze/engine/analyze_runner.dart';
import '../../analyze/engine/analyzor.dart';
import '../../log/uistate/logger.dart' show log;

class TransferResult({
  required final int recognizedCopies,
  required final int notRecognizedCopies,
  final bool aborted = false,
});

class TransferRunner(
  final AnalyzeDirData analyzedFiles,
  final String destDir,
  final String otherDir,
  final DateFormat dateFormat,
) {
  bool _aborted = false;

  Future<TransferResult> transfer() async {
    return await _transferFiles();
  }

  /// if process is running, it will be aborted after
  /// the current file has been copied
  void abort() {
    _aborted = true;
  }

  Future<TransferResult> _transferFiles() async {
    int recognizedCopies = 0;
    int notRecognizedCopies = 0;

    TransferResult result({bool aborted = false}) {
      return .new(
        recognizedCopies: recognizedCopies,
        notRecognizedCopies: notRecognizedCopies,
        aborted: aborted,
      );
    }

    for (var fileData in analyzedFiles.recognized) {
      if (_aborted) {
        return result(aborted: true);
      }
      if (await _transferRecognizedFile(
        fileData,
        destDir,
        otherDir,
        dateFormat,
      )) {
        recognizedCopies++;
      }
    }
    for (var srcPath in analyzedFiles.notRecognized) {
      if (_aborted) {
        return result(aborted: true);
      }
      if (await _transferNotRecognizedFile(
        srcPath,
        otherDir,
      )) {
        notRecognizedCopies++;
      }
    }
    return result();
  }

  Future<bool> _transferRecognizedFile(
    AnalyzeData fileData,
    String destDir,
    String otherDir,
    DateFormat dateFormat,
  ) async {
    final formatted = dateFormat.format(fileData.dateTime);
    Directory fileDestDir = Directory(
      join(destDir, formatted),
    );
    if (!await fileDestDir.exists()) {
      log("Creating directory $fileDestDir ...");
      await fileDestDir.create(recursive: true);
    }
    File destFile = File(
      join(fileDestDir.path, basename(fileData.srcPath)),
    );
    log(
      "Copying from ${fileData.srcPath} to $destFile ...",
    );
    if (await _copyFile(fileData.srcPath, destFile)) {
      await destFile.setLastModified(fileData.dateTime);
      return true;
    }
    return false; // file skipped.
  }

  Future<bool> _transferNotRecognizedFile(
    String srcPath,
    String otherDir,
  ) async {
    Directory fileDestDir = Directory(otherDir);
    if (!await fileDestDir.exists()) {
      fileDestDir.create(recursive: false);
    }
    File destFile = File(join(otherDir, basename(srcPath)));
    log("Copying from $srcPath to $destFile ...");
    if (await _copyFile(srcPath, destFile)) {
      await destFile.setLastModified(
        await File(srcPath).lastModified(),
      );
      return true;
    }
    return false;
  }

  /// copies file, but skips when destFile already exists.
  /// returns true, if file has been copied, false, if
  ///    file has been skipped.
  Future<bool> _copyFile(
    String srcPath,
    File destFile,
  ) async {
    if (await destFile.exists()) {
      log("WARN: $destFile exists. Skipping.");
      return false;
    }
    log("Copying from $srcPath to $destFile ...");
    await File(srcPath).copy(destFile.path);
    log("$destFile has been created.");
    return true;
  }
}
